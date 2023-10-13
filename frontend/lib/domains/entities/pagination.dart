import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination.freezed.dart';

@Deprecated('Use Page instead. Because this class is not immutable.')
@Freezed(makeCollectionsUnmodifiable: false)
class Pagination<T> with _$Pagination<T> {
  const Pagination._();

  const factory Pagination({
    required List<T> items,
    required bool hasMore,
  }) = _Pagination<T>;

  // ignore: prefer_const_constructors
  factory Pagination.empty() => Pagination(items: [], hasMore: false);
  factory Pagination.emptyHasMore() =>
      // ignore: prefer_const_constructors
      Pagination(items: [], hasMore: true);
}

@freezed
class Page<T> with _$Page<T> {
  const Page._();
  const factory Page({
    required List<T> items,
    required bool hasMore,
  }) = _Page<T>;
}
