import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteListOfAppointment extends StatelessWidget {
  const RemoteListOfAppointment({super.key, required this.appointments});
  final List<AppointmentEntitiy> appointments;

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return const Center(child: Text('No appointments found'));
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<RemotCalendarCubit>().getAppointmentsForCurrentUser();
      },
      child: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Text(
                  appointment.title,
                  style: TextStyles.font15BlackSemiBold,
                ),
                subtitle: Text(
                  '${appointment.startingTime.format(context)} - ${appointment.endingTime!= null ? appointment.endingTime!.format(context) : ''}',
                  style: TextStyles.font13DarkBlueRegular,
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.person),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}