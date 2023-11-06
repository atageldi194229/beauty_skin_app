import 'package:flutter/material.dart';

class AppSnackBar {
  void showTextSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          key: const Key('articleContent_shareFailure_snackBar'),
          content: Text(text),
        ),
      );
  }
}
