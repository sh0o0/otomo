import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.errorWidget,
    this.errorListener,
    this.fit,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final LoadingErrorWidgetBuilder? errorWidget;
  final ValueChanged<Object>? errorListener;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      errorWidget: errorWidget,
      errorListener: errorListener,
      fit: fit,
    );
  }
}
