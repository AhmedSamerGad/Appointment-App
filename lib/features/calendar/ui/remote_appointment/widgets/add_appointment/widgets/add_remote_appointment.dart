import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/utils/time_converter.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/logic/cubit/add_appointment_logic_cubit.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/logic/cubit/add_appointment_logic_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/widgets/add_appointment_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddRemoteAppointment extends StatelessWidget {
  const AddRemoteAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Remote Appointment',
          style: TextStyles.font16BlackMedium,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.cancel, color: ColorsManager.gray),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          BlocBuilder<AddAppointmentLogicCubit, AddAppointmentLogicState>(
            builder: (context, state) {
              final cubit = context.read<AddAppointmentLogicCubit>();
              return TextButton(
                onPressed: () {
                  context.read<RemotCalendarCubit>().createAppointment(
                    AppointmentEntitiy(
                      title: cubit.titleController.text,
                      startingDate:
                          context.read<CalendarCubit>().state.selectedDay,
                      startingTime: getStartingTime(
                        cubit.startingTimeController.text,
                      ),
                      endingTime: getStartingTime(
                        cubit.endingTimeController.text,
                      ),
                      attendance: cubit.selectedUsers ?? [],
                      groupId: cubit.selectedGroup.first,
                      rating: [
                        ReviewEntity(
                          ratedUsers: [
                            RatedUserEntity(
                              reviews:
                                  context
                                      .read<AddAppointmentLogicCubit>()
                                      .state
                                      .reviews,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Save', style: TextStyles.font16GrayRegular),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.h, vertical: 14.0.h),
        child: const AddAppointmentBody(),
      ),
    );
  }
}
