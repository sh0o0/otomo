import 'package:flutter/material.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/cases/warn/warn_text.dart';
import 'package:otomo/views/utils/localizations.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({
    super.key,
    required this.images,
    this.showClose = true,
    this.initialIndex = 0,
  });

  final List<ImageProvider> images;
  final bool showClose;
  final int initialIndex;

  static void showFullscreenDialog({
    required BuildContext context,
    required List<ImageProvider> images,
    bool showClose = true,
    int initialIndex = 0,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => PhotoGalleryScreen(
          images: images,
          showClose: showClose,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  @override
  State<PhotoGalleryScreen> createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        Theme.of(context).extension<AppTheme>()!.photoGalleryBackground;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          if (widget.showClose) const CloseButton(color: Colors.white),
        ],
      ),
      backgroundColor: backgroundColor,
      body: PhotoViewGallery.builder(
        pageController: _pageController,
        itemCount: widget.images.length,
        builder: (context, index) => PhotoViewGalleryPageOptions(
          imageProvider: widget.images[index],
          errorBuilder: (context, error, stackTrace) => Center(
            child: WarnText(
              context.l10n.errorFetchImage,
              style: const TextStyle(color: Colors.white),
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
    );
  }
}
