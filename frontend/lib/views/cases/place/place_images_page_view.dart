import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/views/bases/images/app_cached_network_image.dart';
import 'package:otomo/views/cases/warn/warn_text.dart';

class PlacePhotosPageView extends StatelessWidget {
  const PlacePhotosPageView({
    super.key,
    required this.photos,
    this.padding = const EdgeInsets.all(0),
  });

  final List<PlaceDetailsPhoto> photos;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: padding,
          child: PlaceImage(imageUrl: photos[index].photoUrl(maxHeight: 980)),
        );
      },
    );
  }
}

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        color: theme.colorScheme.surface,
        child: AppCachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit,
          errorWidget: (context, url, error) =>
              const Center(child: WarnText('画像の取得に失敗しました。')),
        ),
      ),
    );
  }
}
