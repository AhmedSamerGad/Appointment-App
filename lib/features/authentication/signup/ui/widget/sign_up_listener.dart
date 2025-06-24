// ignore_for_file: deprecated_member_use

import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/authentication/signup/logic/cubit/sign_up_cubit.dart';
import 'package:appointments/features/authentication/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpListener extends StatefulWidget {
  const SignUpListener({super.key});

  @override
  State<SignUpListener> createState() => _SignUpListenerState();
}

class _SignUpListenerState extends State<SignUpListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainBlue,
                    ),
                  ),
            );
          },
          success: (signUpResonse) {
            Navigator.pop(context);
            showSuccessDialog(context);
          },
          error: (message) {
            setupErrorState(context, message);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
              ),
              onPressed: () {
                Navigator.pushNamed(context, StringRoutes.calender);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    Navigator.pop(context);
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
}
