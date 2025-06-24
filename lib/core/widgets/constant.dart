import 'package:appointments/core/thems/styles.dart';
import 'package:flutter/material.dart';

void setupErrorState(BuildContext context, String error) {
  Navigator.pop(context);
  // ignore: inference_failure_on_function_invocation
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          icon: const Icon(Icons.error, color: Colors.red, size: 32),
          content: Text(error, style: TextStyles.font15DarkBlueMedium),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Got it', style: TextStyles.font14BlueSemiBold),
            ),
          ],
        ),
  );
}

