// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $photoGalleryRoute,
    ];

RouteBase get $photoGalleryRoute => GoRouteData.$route(
      path: '/photo-gallery',
      factory: $PhotoGalleryRouteExtension._fromState,
    );

extension $PhotoGalleryRouteExtension on PhotoGalleryRoute {
  static PhotoGalleryRoute _fromState(GoRouterState state) => PhotoGalleryRoute(
        images: state.uri.queryParametersAll['images']?.map((e) => e).toList(),
      );

  String get location => GoRouteData.$location(
        '/photo-gallery',
        queryParams: {
          'images': images,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
