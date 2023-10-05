import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/views/bases/images/app_cached_network_image.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/warn/warn_text.dart';

class PlacePhotosPageView extends StatefulWidget {
  const PlacePhotosPageView({
    super.key,
    required this.photos,
    this.padding = const EdgeInsets.all(0),
    this.photoHeight = 240,
    this.photoWidth,
    this.dotsIndicator = true,
  });

  final List<PlaceDetailsPhoto> photos;
  final EdgeInsets padding;
  final double? photoWidth;
  final double photoHeight;
  final bool dotsIndicator;

  @override
  State<PlacePhotosPageView> createState() => _PlacePhotosPageViewState();
}

class _PlacePhotosPageViewState extends State<PlacePhotosPageView> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.photoHeight,
          child: PageView.builder(
            itemCount: widget.photos.length,
            onPageChanged: (index) => setState(() {
              _currentPage = index;
            }),
            itemBuilder: (context, index) {
              return Padding(
                padding: widget.padding,
                child: PlaceImage(
                  imageUrl: widget.photos[index].photoUrl(maxHeight: 980),
                  width: widget.photoWidth,
                ),
              );
            },
          ),
        ),
        Spaces.h8,
        DotsIndicator(
          dotsCount: widget.photos.length,
          position: _currentPage,
        )
      ],
    );
  }
}

class PlaceImage extends StatelessWidget {
  const PlaceImage({
    super.key,
    required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  });

  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        height: height,
        width: width,
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
