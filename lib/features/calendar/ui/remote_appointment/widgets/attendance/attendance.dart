// ignore_for_file: unnecessary_null_comparison

import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/constant.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/attendance/widget/grid_view.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/attendance/widget/save_configration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key, required this.appointment});
  final AppointmentEntitiy appointment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance', style: TextStyles.font18BlackDisplayBold),
        actionsPadding: const EdgeInsets.all(16.0),
        centerTitle: true,
        toolbarHeight: 70.h,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          BlocListener<RemotCalendarCubit, RemotCalendarState>(
            listener: (context, state) {
              state.whenOrNull(
                remoteLoading:
                    () => const Center(child: CircularProgressIndicator()),
                remoteSuccess: (data) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacementNamed(
                      context,
                      StringRoutes.calender,
                    );
                  });
                },
                remoteError: (error) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setupErrorState(context, error);
                  });
                },
              );
            },
            child: SaveConfigration(
              appointment: appointment,
              cubit: context.read<RemotCalendarCubit>(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: AttendanceGridView(appointment: appointment),
      ),
    );
  }
}
