import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_buttons.dart';
import 'package:appointments/core/widgets/constant.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_state.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_state.dart';
import 'package:appointments/features/calendar/ui/widgets/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAppointmentBlocListener extends StatelessWidget {
  const AddAppointmentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false; // Track loading state locally

    return BlocListener<LocalCalendarCubit, LocalCalendarState>(
      listener: (context, state) {
        state.when(
          loading: () {
            isLoading = true;
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          success: (data) {
            if (isLoading) {
              isLoading = false;
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.pushNamedAndRemoveUntil(
                context,
                StringRoutes.calender,
                (route) => false,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Appointment created successfully')),
              );
            }
          },
          error: (message) {
            if (isLoading) {
              isLoading = false;
              Navigator.of(context, rootNavigator: true).pop();
              setupErrorState(context, message);
            }
          },
        );
      },
      child: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          return Center(
            child: AppTextButton(
              buttonText: 'Create Appointment',
              textStyle: TextStyles.font14DarkBlueMedium,
              onPressed: () async {
                if (context.read<CalendarCubit>().formKey.currentState!.validate()) {
                  try {
                    final startText = context.read<CalendarCubit>().startingTime.text.trim();
                    final endText = context.read<CalendarCubit>().endingTime.text.trim();
                    final selectedDay = CalendarView.selectedDate!;

                    final startingTime = context.read<LocalCalendarCubit>().getStartingTime(startText);
                    final endingTime = endText.isNotEmpty
                        ? context.read<LocalCalendarCubit>().getStartingTime(endText)
                        : null;

                    // Validate time
                    if (endingTime != null && _isEndTimeBeforeStartTime(startingTime, endingTime)) {
                      setupErrorState(context, 'End time must be after start time');
                      return;
                    }

                    context.read<LocalCalendarCubit>().createAppointment(
                      AppointmentEntitiy(
                        title: context.read<CalendarCubit>().titleController.text,
                        startingDate: DateTime(
                          selectedDay.year,
                          selectedDay.month,
                          selectedDay.day,
                        ),
                        attendance: const [],
                        startingTime: startingTime,
                        endingTime: endingTime,
                        status: 'pending',
                        
                      ),
                    );
                  } catch (e) {
                    setupErrorState(context, 'Invalid time format');
                  }
                }
              },
            ),
          );
        },
      ),
    );
  }

  bool _isEndTimeBeforeStartTime(TimeOfDay start, TimeOfDay end) {
    return end.hour < start.hour || 
           (end.hour == start.hour && end.minute <= start.minute);
  }
}