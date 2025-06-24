import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.isLowerCase,
    required this.isUpperCase,
    required this.hasSpacialChar,
    required this.hasDigit,
    required this.hasMinLength,
  });

  final bool isLowerCase;
  final bool isUpperCase;
  final bool hasSpacialChar;
  final bool hasDigit;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    String message = '';

    if (!isLowerCase) {
      message = 'At least 1 lowercase letter';
    } else if (!isUpperCase) {
      message = 'At least 1 uppercase letter';
    } else if (!hasDigit) {
      message = 'At least 1 number';
    } else if (!hasSpacialChar) {
      message = 'At least 1 special character';
    } else if (!hasMinLength) {
      message = 'At least 8 characters long';
    } else {
      message = 'done';
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        message,
        style: TextStyle(color: message == 'done' ? Colors.green : Colors.red),
      ),
    );
  }
}
