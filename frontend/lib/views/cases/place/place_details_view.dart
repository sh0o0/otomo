import 'package:flutter/material.dart';
import 'package:otomo/domains/entities/place_details.dart';
import 'package:otomo/views/app.dart';
import 'package:otomo/views/bases/snackbars/app_snackbar.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/utils/flutter.dart';
import 'package:otomo/views/utils/launcher.dart';
import 'package:otomo/views/utils/localizations.dart';

class PlaceDetailsView extends StatelessWidget {
  const PlaceDetailsView({
    super.key,
    required this.place,
  });

  final PlaceDetails place;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTileTheme(
      data: ListTileThemeData(
        iconColor: theme.colorScheme.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineSmall(context.l10n.placeDetails,
              style: TextStyles.bold),
          Spaces.h8,
          ...ListTile.divideTiles(
            context: context,
            tiles: [
              if (place.formattedPhoneNumber != null)
                PlacePhoneNumberListTile(
                  phoneNumber: place.formattedPhoneNumber!,
                ),
              if (place.website != null)
                PlaceWebsiteListTile(website: place.website!),
              if (place.formattedAddress != null)
                PlaceAddressListTile(
                  address: place.formattedAddress!,
                  googlePlaceId: place.placeId ?? '',
                ),
              if (place.currentOpeningHours != null)
                PlaceOpeningHoursPeriodsExpansionTile(
                  openingHours: place.currentOpeningHours!,
                ),
            ],
          ).toList()
        ],
      ),
    );
  }
}

// TODO: Modify to like google map
class PlaceOpeningHoursPeriodsExpansionTile extends StatelessWidget {
  const PlaceOpeningHoursPeriodsExpansionTile({
    super.key,
    required this.openingHours,
  });

  final PlaceDetailsOpeningHours openingHours;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(left: 40),
      leading: Icon(
        Icons.access_time_rounded,
        color: theme.colorScheme.primary,
      ),
      title: BodyMedium(context.l10n.placeBusinessHours),
      children: [
        for (var period in openingHours.periods ?? [])
          PlacePeriodListTile(period: period),
      ],
    );
  }
}

class PlacePeriodListTile extends StatelessWidget {
  const PlacePeriodListTile({
    super.key,
    required this.period,
  });

  final PlaceDetailsHoursPeriod period;

  String stringToTime(String time) {
    return '${time.substring(0, 2)}:${time.substring(2)}';
  }

  String periodDetailsToTime(
      BuildContext context, PlaceDetailsHoursPeriodDetail detail) {
    return context.l10n
        .placeBusinessHoursPeriod(detail.day, stringToTime(detail.time));
  }

  @override
  Widget build(BuildContext context) {
    String times = '${periodDetailsToTime(context, period.open)} - ';
    if (period.close == null) {
      times += stringToTime(period.close!.time);
    }

    return ListTile(title: BodyMedium(times));
  }
}

class PlaceAddressListTile extends StatelessWidget {
  const PlaceAddressListTile({
    super.key,
    required this.address,
    this.googlePlaceId,
  });

  final String address;
  final String? googlePlaceId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on_rounded),
      title: BodyMedium(address),
      onTap: () => Launcher.searchOnGoogleMap(
        query: address,
        placeId: googlePlaceId ?? '',
      ),
      onLongPress: () async {
        await FlutterUtils.copyText(address);
        App.showSnackBar(
            snackBarBuilder: (context) =>
                AppSnackbar.text(context.l10n.copied));
      },
    );
  }
}

class PlaceWebsiteListTile extends StatelessWidget {
  const PlaceWebsiteListTile({
    super.key,
    required this.website,
  });

  final String website;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.web_rounded),
      title: BodyMedium(website),
      onTap: () => Launcher.urlString(website),
      onLongPress: () async {
        await FlutterUtils.copyText(website);
        App.showSnackBar(
            snackBarBuilder: (context) =>
                AppSnackbar.text(context.l10n.copied));
      },
    );
  }
}

class PlacePhoneNumberListTile extends StatelessWidget {
  const PlacePhoneNumberListTile({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.phone_rounded),
      title: BodyMedium(phoneNumber),
      onTap: () => Launcher.anyFormatTel(phoneNumber),
      onLongPress: () async {
        await FlutterUtils.copyText(phoneNumber);
        App.showSnackBar(
            snackBarBuilder: (context) =>
                AppSnackbar.text(context.l10n.copied));
      },
    );
  }
}
