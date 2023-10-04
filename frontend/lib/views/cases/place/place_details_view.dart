import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/utils/links.dart';

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
          const HeadlineSmall('Details', style: TextStyles.bold),
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
                PlaceAddressListTile(address: place.formattedAddress!),
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
      title: const BodyMedium('Opening Hours'),
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

  String periodDetailsToTime(PlaceDetailsHoursPeriodDetail detail) {
    return '${detail.day}日: ${stringToTime(detail.time)}';
  }

  @override
  Widget build(BuildContext context) {
    String times = '${periodDetailsToTime(period.open)} - ';
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
  });

  final String address;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on_rounded),
      title: BodyMedium(address),
      onTap: () => Launcher.searchOnGoogleMap(placeId: address),
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
    );
  }
}
