// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_buttons.dart';
import 'package:appointments/core/widgets/constant.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/add_appointment/widgets/add_remote_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpiredStatus extends StatelessWidget {
  const ExpiredStatus({super.key, this.appointment});
  final AppointmentEntitiy ? appointment;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         AddOrUpdateRemoteAppointment(appointment: appointment,),
        Positioned.fill(
          child: AbsorbPointer(
            absorbing: true,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(color: Colors.black.withOpacity(0.1)),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10.h,
            children: [
              Text(
                "This appointment is expired",
                style: TextStyles.font16WhiteMedium.copyWith(color: Colors.black),
              ),
              
              AppTextButton(
                buttonText: 'Delete',
                textStyle: TextStyles.font16WhiteSemiBold.copyWith(color: Colors.white),
                
                backgroundColor: Colors.redAccent,
                // horizontalPadding: 20.w,
                // verticalPadding: 30.h,
                buttonWidth: 120.w,
                onPressed: (){
                  BlocBuilder<RemotCalendarCubit, RemotCalendarState>(
                    builder: (context, state) {
                      return state.maybeWhen(remoteLoading: () {
                        return const Center(child: const CircularProgressIndicator());
                      },
                      remoteSuccess: (data) {

                        final cubit = context.read<RemotCalendarCubit>();
                        cubit.appointments.removeWhere((key, value) => value.any((appointment) => appointment.appointmentId == this.appointment?.appointmentId));
                        Navigator.pushNamed(context , StringRoutes.calender);
                      return const SnackBar(content: Text('Appointment deleted successfully'));
                      } , remoteError: (error) {
                        setupErrorState(context, error);
                        return SnackBar(content: Text(error.toString()));
                      }
                      , orElse: () {
                        return const Center(child: Text('Unexpected state'));
                      },);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
