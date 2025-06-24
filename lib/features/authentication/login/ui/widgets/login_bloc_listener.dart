// ignore_for_file: strict_raw_type, inference_failure_on_function_invocation

import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/thems/colors.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
          success: (loginResponse) {
            Navigator.pop(context);
            Navigator.pushNamed(context, StringRoutes.calender);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

 
}
