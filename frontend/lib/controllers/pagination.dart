import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination.freezed.dart';

// TODO: makeCollectionsUnmodifiable to true
@Freezed(makeCollectionsUnmodifiable: false)
class Pagination<T> with _$Pagination<T> {
  const Pagination._();

  const factory Pagination({
    required List<T> items,
    required bool hasMore,
  }) = _Pagination<T>;

  factory Pagination.empty() => const Pagination(items: [], hasMore: false);
  factory Pagination.emptyHasMore() =>
      const Pagination(items: [], hasMore: true);
}
