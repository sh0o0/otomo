import 'package:otomo/views/app.dart';
import 'package:otomo/views/cases/error/error_snackbar.dart';
import 'package:otomo/views/utils/error_library.dart';

void showErrorSnackbar(Object error) {
  final text = ErrorLibrary.fromAny(error);
  App.showSnackBar(ErrorSnackbar.text(text));
}
