import 'package:flutter/material.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/cases/warn/warn_text.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoGallery extends StatelessWidget {
  const PhotoGallery({
    super.key,
    required this.images,
  });

  final List<ImageProvider> images;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        Theme.of(context).extension<AppTheme>()!.photoGalleryBackground;
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: PhotoViewGallery.builder(
          itemCount: images.length,
          builder: (context, index) => PhotoViewGalleryPageOptions(
            imageProvider: images[index],
            errorBuilder: (context, error, stackTrace) => const Center(
              child: WarnText(
                '画像の取得に失敗しました。',
                style: TextStyle(color: Colors.white),
              ),
            ),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
          loadingBuilder: ((context, event) {
            return Center(
              child: AppCircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            );
          }),
          backgroundDecoration: BoxDecoration(color: backgroundColor),
        ),
      ),
    );
  }
}
