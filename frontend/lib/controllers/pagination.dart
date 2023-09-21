import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination.freezed.dart';

// TODO: makeCollectionsUnmodifiable to true
@Freezed(makeCollectionsUnmodifiable: false)
class Pagination<T> with _$Pagination<T> {
  const factory Pagination({
    required List<T> items,
    required bool hasMore,
  }) = _Pagination<T>;
}
