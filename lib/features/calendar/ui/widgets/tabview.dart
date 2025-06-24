// ignore_for_file: strict_raw_type

import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_state.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_state.dart';
import 'package:appointments/features/calendar/ui/local_appointment/list_of_appointments.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/remote_list_of_appointment.dart';
import 'package:appointments/features/calendar/ui/widgets/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.blue,
            splashBorderRadius: BorderRadius.circular(30.h),
            tabs: const [
              Tab(text: 'Local Appointments'),
              Tab(text: 'Remote Appointments'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Local Appointments Tab
                BlocBuilder<LocalCalendarCubit, LocalCalendarState>(
                  buildWhen:
                      (previous, current) =>
                          current is Loading ||
                          current is Error ||
                          current is Success,
                  builder: (context, state) {
                    return state.when(
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      success: (appointments) {
                        if (appointments.isEmpty) {
                          return const Center(
                            child: Text('No appointments today'),
                          );
                        }
                        return ListOfAppointments(appointments: appointments);
                      },
                      error: (error) => Center(child: Text('Error: $error')),
                    );
                  },
                ),

                // Remote Appointments Tab
                // In your TabView widget, update the remote appointments part:
                BlocBuilder<RemotCalendarCubit, RemotCalendarState>(
                  buildWhen: (previous, current) => current != previous,
                  builder: (context, state) {
                   return state.maybeWhen(
                    remoteError: (error) => const Center(child: Text('some thing go worng'),),
                      remoteDayChange: (appointmentsMap ,selectedDay) {
                       
                         selectedDay =
                            CalendarView.selectedDate ?? DateTime.now();

                        final normalizedDay = DateTime(
                          selectedDay.year,
                          selectedDay.month,
                          selectedDay.day,
                        );

                        final dayAppointments =
                            context
                                .read<RemotCalendarCubit>()
                                .loadAppointmentsForDay(normalizedDay);
                        if (dayAppointments.isEmpty) {
                          return const Center(
                            child: Text('No remote appointments today'),
                          );
                        } else {
                          return RemoteListOfAppointment(
                            appointments: dayAppointments,
                          );
                        }
                        

                        
                      },orElse: () => const Center(child: Text('no remote appointments today')),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
