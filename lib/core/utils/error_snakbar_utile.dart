import 'package:flutter/material.dart';

class ErrorSnackbarUtil {
  static showError(BuildContext context, String? error) {
    if (error != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
    }
  }
}
