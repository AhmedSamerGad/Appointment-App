import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/widgets/add_appointment_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddRemoteAppointment extends StatefulWidget {
  const AddRemoteAppointment({super.key});

  @override
  State<AddRemoteAppointment> createState() => _AddRemoteAppointmentState();
}

class _AddRemoteAppointmentState extends State<AddRemoteAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Add Remote Appointment', style: TextStyles.font16BlackMedium,),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.cancel, color: ColorsManager.gray),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle save action
            },
            child: Text('Cancle', style: TextStyles.font16GrayRegular),
          ),
        ],
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.h, vertical: 14.0.h),
        child: AddAppointmentBody(),
      )
    );
  }
}