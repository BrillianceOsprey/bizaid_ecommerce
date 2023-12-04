import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_app/src/shared/errors/exceptions.dart';
import 'package:starter_app/src/shared/widgets/alert_dialogs.dart';

/// A helper [AsyncValue] extension to show an alert dialog on error
extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(
    BuildContext context, {
    String? title,
  }) {
    if (!isLoading && hasError) {
      final message = _errorMessage(error);
      showExceptionAlertDialog(
        context: context,
        title: title ?? 'Error',
        exception: message,
      );
    }
  }

  String _errorMessage(Object? error) {
    if (error is AppException) {
      return error.message;
    } else {
      return error.toString();
    }
  }
}
