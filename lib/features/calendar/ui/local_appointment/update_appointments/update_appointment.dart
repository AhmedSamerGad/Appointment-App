import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/utils/time_converter.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_cubit.dart';
import 'package:appointments/features/calendar/ui/local_appointment/add_appointment/widgets/time_picker.dart';
import 'package:appointments/features/calendar/ui/local_appointment/update_appointments/widgets/date_picker.dart';
import 'package:appointments/features/calendar/ui/local_appointment/update_appointments/widgets/update_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UpdateAppointment extends StatefulWidget {
 const UpdateAppointment({super.key, required this.appointmentId});

  final AppointmentEntitiy appointmentId;

  @override
  State<UpdateAppointment> createState() => _UpdateAppointmentState();
}

class _UpdateAppointmentState extends State<UpdateAppointment> {
  late TextEditingController titleControllar;
  late TextEditingController startingDateControllar;
  //i will use it when active the ranged dates
  // late TextEditingController endingDateControllar ;
  late TextEditingController startingTimeControllar;
  late TextEditingController endingTimeControllar;
  @override
  void dispose() {
    super.dispose();
    endingTimeControllar.dispose();
    startingDateControllar.dispose();
    startingTimeControllar.dispose();
    titleControllar.dispose();
  }

  @override
  void initState() {
    titleControllar = TextEditingController(text: widget.appointmentId.title);
    startingDateControllar = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(widget.appointmentId.startingDate),
    );
    startingTimeControllar = TextEditingController(
      text: _formatTimeOfDay(widget.appointmentId.startingTime),
    );
    endingTimeControllar = TextEditingController(
      text:
          widget.appointmentId.endingTime != null
              ? _formatTimeOfDay(widget.appointmentId.endingTime!)
              : '',
    );
    super.initState();
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }
    void _handleUpdate() {
    final updatedAppointment = widget.appointmentId.copyWith(
      title: titleControllar.text,
      startingDate: DateTime.parse(startingDateControllar.text),
      startingTime: 
          getStartingTime(startingTimeControllar.text.trim()),
      endingTime: endingTimeControllar.text.isNotEmpty
          ? getStartingTime(endingTimeControllar.text.trim())
          : null,
    );

    debugPrint('Updating with date: ${updatedAppointment.startingDate}');
    
    context.read<LocalCalendarCubit>().updateAppointment(
      widget.appointmentId.appointmentId!,
      updatedAppointment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Appointment', style: TextStyles.font24BlueBold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0.h),
          child: Column(
            spacing: 12.h,
            children: [
              AppTextFormField(
                controller: titleControllar,
                validator: (value) {},
                label: Text('Title', style: TextStyles.font14DarkBlueMedium),
                inputTextStyle: TextStyles.font15BlackSemiBold,
              ),
              DatePicker(
                dateControllar: startingDateControllar,
                title: 'Starting Date',
              ),
              TimePicker(
                title: 'Starting Time',
                controller: startingTimeControllar,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    final regex12Hour = RegExp(
                      r'^(0[1-9]|1[0-2]):[0-5][0-9]\s?(AM|PM)$',
                      caseSensitive: false,
                    ).hasMatch(value);
                    if (!regex12Hour) {
                      return 'Ending time is not valid';
                    }
                  }
                  return null;
                },
              ),
              TimePicker(
                title: 'Ending Time',
                controller: endingTimeControllar,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    final regex12Hour = RegExp(
                      r'^(0[1-9]|1[0-2]):[0-5][0-9]\s?(AM|PM)$',
                      caseSensitive: false,
                    ).hasMatch(value);
                    if (!regex12Hour) {
                      return 'Ending time is not valid';
                    }
                  }

                  return null;
                },
              ),
              SizedBox(height: 12.h),
              UpdateListener(
                onPressed: _handleUpdate,
                onCancel: () {
                  Navigator.pushReplacementNamed(
                    context,
                    StringRoutes.calender,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
