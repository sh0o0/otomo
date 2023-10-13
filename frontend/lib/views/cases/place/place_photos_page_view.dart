import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:otomo/domains/entities/place_details.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/photo/google_place_photo.dart';

typedef PhotoTapCallback = void Function(BuildContext context, int index);

class PlacePhotosPageView extends StatefulWidget {
  const PlacePhotosPageView({
    super.key,
    required this.photos,
    this.padding = const EdgeInsets.all(0),
    this.photoHeight = 240,
    this.photoWidth,
    this.dotsIndicator = true,
    this.onTap,
  });

  final List<PlaceDetailsPhoto> photos;
  final EdgeInsets padding;
  final double? photoWidth;
  final double photoHeight;
  final bool dotsIndicator;
  final PhotoTapCallback? onTap;

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
                child: GestureDetector(
                  onTap: () => widget.onTap?.call(context, index),
                  child: PlaceImage(
                    googlePhotoReference: widget.photos[index].photoReference,
                    width: widget.photoWidth,
                  ),
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
    required this.googlePhotoReference,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  });

  final String googlePhotoReference;
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
        child: GooglePlacePhoto(
          photoReference: googlePhotoReference,
          fit: fit,
        ),
      ),
    );
  }
}
