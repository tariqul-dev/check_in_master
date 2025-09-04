import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog({
    String? message,
    required BuildContext context,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.isCurrent != true) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) => WillPopScope(
          onWillPop: () async => false, // disable back press
          child: AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 16),
                Expanded(child: Text(message ?? 'Loading...')),
              ],
            ),
          ),
        ),
      );
    });
  }

  static void hideDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  static void showMessageDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.isCurrent != true) return;

      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }
}
