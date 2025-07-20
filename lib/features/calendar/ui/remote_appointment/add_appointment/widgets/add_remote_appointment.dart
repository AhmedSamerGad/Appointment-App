import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/utils/time_converter.dart';
import 'package:appointments/core/widgets/constant.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/add_appointment/logic/cubit/add_appointment_logic_cubit.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/add_appointment/logic/cubit/add_appointment_logic_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/add_appointment/widgets/add_appointment_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOrUpdateRemoteAppointment extends StatelessWidget {
  const AddOrUpdateRemoteAppointment({super.key, this.appointment});

  final AppointmentEntitiy? appointment;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddAppointmentLogicCubit>();

    // Initialize form fields if editing
    if (appointment != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        cubit.initializeForEdit(appointment!, context);
      });
    }

    return BlocBuilder<AddAppointmentLogicCubit, AddAppointmentLogicState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              appointment == null ? 'Add Remote Appointment' : 'Edit Remote Appointment',
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
              BlocBuilder<RemotCalendarCubit, RemotCalendarState>(
                builder: (context, state) {
                  
                  return TextButton(
                    onPressed: () {
                      final entity = AppointmentEntitiy(
                        mongoId: appointment?.mongoId,
                        title: cubit.titleController.text,
                        startingDate: context.read<CalendarCubit>().state.selectedDay,
                        startingTime: getStartingTime(cubit.startingTimeController.text),
                        endingTime: getStartingTime(cubit.endingTimeController.text),
                        attendance: cubit.selectedUsers,
                        groupId: cubit.selectedGroup,
                        rating: [
                          ReviewEntity(
                            ratedUsers: [
                              RatedUserEntity(
                                reviews: cubit.state.reviews,
                              ),
                            ],
                          ),
                        ],
                      );

                      if (appointment == null) {
                        context.read<RemotCalendarCubit>().createAppointment(entity);
                         state.whenOrNull(
                        remoteSuccess: (data) {
                          Navigator.pushReplacementNamed(context, StringRoutes.calender);
                        },
                        remoteLoading: () {
                          return const Center(child: CircularProgressIndicator());
                        },
                        remoteError: (error) {
                          setupErrorState(context, error);
                        },
                      );
                      } else {
                        context.read<RemotCalendarCubit>().updateAppointment(entity);
                         state.whenOrNull(
                        remoteSuccess: (data) {
                          Navigator.pushReplacementNamed(context, StringRoutes.calender);
                        },
                        remoteLoading: () {
                          return const Center(child: CircularProgressIndicator());
                        },
                        remoteError: (error) {
                          setupErrorState(context, error);
                        },
                      );
                      }

                     
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
      },
    );
  }
} 
