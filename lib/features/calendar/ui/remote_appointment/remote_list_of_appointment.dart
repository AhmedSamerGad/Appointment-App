import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoteListOfAppointment extends StatelessWidget {
  const RemoteListOfAppointment({super.key, required this.appointments});
  final List<AppointmentEntitiy> appointments;
  Color getStatusColor(String status) {
    switch (status) {
      case 'rejected':
        return Colors.red;
      case 'inactive':
        return Colors.grey;
      case 'active':
        return Colors.green;
      case 'expired':
        return Colors.orange;
      case 'completed':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }

  double getAttendacePercentagePercent(int index) {
    final total = appointments[index].attendance?.length ?? 0;
    final accepted = appointments[index].acceptedBy?.length ?? 0;

    if (total == 0) return 0;

    return ((accepted / total) * 100).round().toDouble();
  }

  goToRoute(int index, context) {
    switch (appointments[index].status) {
      case 'inactive':
        Navigator.pushNamed(
          context,
          StringRoutes.addRemoteAppointment,
          arguments: appointments[index],
        );
        break;
      case 'active':
        Navigator.pushNamed(
          context,
          StringRoutes.attendance,
          arguments: appointments[index],
        );
        break;
      case 'expired':
        // Navigate to expired appointment details
        break;
      case 'completed':
        // Navigate to completed appointment details
        break;
      default:
      // Handle unknown status
    }
  }

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
                  '${appointment.startingTime.format(context)} - ${appointment.endingTime != null ? appointment.endingTime!.format(context) : ''}',
                  style: TextStyles.font13DarkBlueRegular,
                ),
                leading: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.person),
                ),
                onTap: () {
                  goToRoute(index, context);
                },
                trailing: Column(
                  spacing: 10.h,
                  children: [
                    Text(
                      appointment.status,
                      style: TextStyles.font12BlueRegular.copyWith(
                        color: getStatusColor(appointment.status),
                      ),
                    ),

                    Text(
                      getAttendacePercentagePercent(index).toString(),
                      style: TextStyles.font13BlueSemiBold.copyWith(
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
