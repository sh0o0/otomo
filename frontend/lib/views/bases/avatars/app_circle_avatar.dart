import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otomo/tools/logger.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    this.imageUrl,
    this.imageProvider,
  }) : assert(imageUrl != null || imageProvider != null);

  final String? imageUrl;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: imageUrl != null
          ? CachedNetworkImageProvider(imageUrl!)
          : imageProvider,
      onBackgroundImageError: (exception, stackTrace) => logger.warn(exception),
    );
  }
}
