import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otomo/views/pages/photo_gallery.dart';

part 'routes.g.dart';

final class Routes {
  Routes._();

  static const signIn = '/sign_in';
  static const signInWithEmailLink = '$signIn/email';
  static const home = '/';
  static const settings = '/settings';
  static const accountDeletion = '$settings/account_deletion';
}


@TypedGoRoute<PhotoGalleryRoute>(path: '/photo-gallery')
class PhotoGalleryRoute extends GoRouteData {
  const PhotoGalleryRoute({
    required this.images,
  });

  final List<ImageProvider> images;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PhotoGallery(images: images);
  }
}
