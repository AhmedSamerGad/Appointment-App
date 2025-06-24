// ignore_for_file: strict_raw_type, inference_failure_on_function_invocation

import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_buttons.dart';
import 'package:appointments/core/widgets/constant.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateListener extends StatefulWidget {
  const UpdateListener({
    super.key,
    required this.onPressed,
    required this.onCancel,
  });
 final VoidCallback onPressed;
  final VoidCallback onCancel;

  @override
  State<UpdateListener> createState() => _UpdateListenerState();
}

class _UpdateListenerState extends State<UpdateListener> {
  AppointmentEntitiy? updatedOne;
   // ignore: unused_field
   late final LocalCalendarCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<LocalCalendarCubit>();
  }
@override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<LocalCalendarCubit, LocalCalendarState>(
      listenWhen: (previous, current) => 
          previous != current ,
      listener: (context, state) {
        state.when(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ),
              ),
            );
          },
          success: (data) {
            Navigator.pop(context);
            Navigator.pushNamed(context, StringRoutes.calender);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: AppTextButton(
                onPressed: widget.onPressed,
                buttonText: 'Update',
                textStyle: TextStyles.font16WhiteSemiBold,
                backgroundColor: ColorsManager.mainBlue,
              ),
            ),
            Expanded(
              child: AppTextButton(
                buttonText: 'Cancle',
                textStyle: TextStyles.font16WhiteSemiBold,
                backgroundColor: Colors.redAccent,
                onPressed: widget.onCancel,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
