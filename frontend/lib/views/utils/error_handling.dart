import 'package:otomo/views/app.dart';
import 'package:otomo/views/cases/error/error_snackbar.dart';
import 'package:otomo/views/utils/error_library.dart';

void showErrorSnackbar(Object error) {
  App.showSnackBar(snackBarBuilder: (context) {
    final text = ErrorLibrary.fromAnyOf(context, error);
    return ErrorSnackbar.text(text);
  });
}
