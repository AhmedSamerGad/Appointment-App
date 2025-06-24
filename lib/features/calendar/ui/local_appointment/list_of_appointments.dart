import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfAppointments extends StatelessWidget {
  const ListOfAppointments({super.key, required this.appointments});
  final List<AppointmentEntitiy> appointments;

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return const Center(child: Text('No appointments found'));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Card(
            color: ColorsManager.lightGray,
            child: ListTile(
              leading: const Icon(Icons.event),
              title: Text(
                appointment.title,
                style: TextStyles.font15BlackSemiBold,
              ),
              subtitle: Text(
                '${appointment.startingTime.format(context)} - '
                '${appointment.endingTime?.format(context) ?? ''}',
                style: TextStyles.font13DarkBlueRegular,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<LocalCalendarCubit>().deleteAppointment(
                    appointment.appointmentId!,
                  );
                },
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StringRoutes.updateLocalAppointment,
                  arguments: appointment,
                );
              },
            ),
          );
        },
      ),
    );
  }
}