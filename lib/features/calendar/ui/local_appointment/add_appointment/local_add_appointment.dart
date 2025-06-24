import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:appointments/features/calendar/ui/local_appointment/add_appointment/widgets/add_bloc_listener.dart';
import 'package:appointments/features/calendar/ui/local_appointment/add_appointment/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocalAddAppointment extends StatefulWidget {
  const LocalAddAppointment({super.key});

  @override
  State<LocalAddAppointment> createState() => _LocalAddAppointmentState();
}

class _LocalAddAppointmentState extends State<LocalAddAppointment> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 25.h),
          child: Form(
            key: context.read<CalendarCubit>().formKey,
            child: Column(
              spacing: 12.h,
              children: [
                AppTextFormField(
                  controller: context.read<CalendarCubit>().titleController,
                  label: Text('Title', style: TextStyles.font13DarkBlueMedium),
                  validator: (value) {
                    if (value!.isEmpty || value.trim() == '') {
                      return 'title is required';
                    }
                    return null;
                  },
                ),
                TimePicker(
                  title: 'Starting Time',
                  controller: context.read<CalendarCubit>().startingTime,
                  validator: (value) {
                    final regex12Hour = RegExp(
                      r'^([1-9]|1[0-2]):[0-5][0-9]\s?(AM|PM)$',
                      caseSensitive: false,
                    ).hasMatch(value!);
                    if (value.isEmpty || value.trim() == '') {
                      return 'Starting time is required';
                    } else if (!regex12Hour) {
                      return 'Starting time is not valid';
                    }
                    return null;
                  },
                ),
                TimePicker(
                  title: 'Ending Time',
                  controller: context.read<CalendarCubit>().endingTime,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      final regex12Hour = RegExp(
                        r'^([1-9]|1[0-2]):[0-5][0-9]\s?(AM|PM)$',
                        caseSensitive: false,
                      ).hasMatch(value);
                      if (!regex12Hour) {
                        return 'Ending time is not valid';
                      }
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                const AddAppointmentBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
