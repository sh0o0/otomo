import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:otomo/configs/app_config.dart';
import 'package:otomo/tools/google_api.dart';
import 'package:otomo/tools/reg_exps.dart';
import 'package:otomo/views/bases/images/app_cached_network_image.dart';
import 'package:otomo/views/cases/warn/warn_text.dart';

class GooglePlacePhoto extends StatelessWidget {
  const GooglePlacePhoto({
    super.key,
    required this.photoReference,
    this.maxHeight = 980,
    this.fit,
  });

  final String photoReference;
  final int maxHeight;
  final BoxFit? fit;

  static String getUrl(
    String photoReference, {
    int maxHeight = 980,
  }) {
    if (RegExps.url.hasMatch(photoReference)) return photoReference;
    return 'https://maps.googleapis.com/maps/api/place/photo?maxheight=$maxHeight&photo_reference=$photoReference&key=${appConfig.googleMapApiKey}';
  }

  static ImageProvider provider(
    String photoReference, {
    int maxHeight = 980,
  }) =>
      CachedNetworkImageProvider(
        getUrl(photoReference, maxHeight: maxHeight),
        headers: GoogleAPIHeaders.fromEnvironment().toMap(),
      );

  @override
  Widget build(BuildContext context) {
    return AppCachedNetworkImage(
      imageUrl: getUrl(photoReference, maxHeight: maxHeight),
      fit: fit,
      errorWidget: (context, url, error) =>
          const Center(child: WarnText('画像の取得に失敗しました。')),
      httpHeaders: GoogleAPIHeaders.fromEnvironment().toMap(),
    );
  }
}
