import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/tools/logger.dart';

Future<AsyncValue<T>> guard<T>(Future<T> Function() future) async {
  final result = await AsyncValue.guard(future);
  if (result.hasError) {
    logger.warn(
        'Error occurred while guarding. Error: ${result.error}, StackTrace: ${result.stackTrace}');
  }
  return result;
}
