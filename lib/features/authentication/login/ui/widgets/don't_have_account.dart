// ignore_for_file: file_names

import 'package:appointments/core/routing/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/thems/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font13BlueSemiBold,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushReplacementNamed(
                      context,
                      StringRoutes.signUp,
                    );
                  },
          ),
        ],
      ),
    );
  }
}
