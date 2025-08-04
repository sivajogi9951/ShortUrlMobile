import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:short_url/core/error/exceptions.dart';

extension AsyncUi on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      if (ModalRoute.of(context)?.isCurrent == false) {
        return;
      }

      final message = _errorMessage(error);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          icon: Icon(Icons.error, color: Colors.red),
          title: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  _errorMessage(Object? error) {
    if (error is NetworkException) {
      return error.message;
    } else if (error is ServerException) {
      return error.message;
    }
  }
}
