// ignore_for_file: must_be_immutable

import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimePicker extends StatefulWidget {
   TimePicker({super.key, required this.title,  required this.controller,  this.hintText,  this.validator,});
  final String title;
   TextEditingController controller;
  final Function(String?)? validator;
  final String? hintText;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {

  @override
  Widget build(BuildContext context) {
    return Row(
            spacing: 5.h,
            children: [
               Expanded(
                flex: 2,
                 child: AppTextFormField(controller: widget.controller,
                 label: Text(widget.title,style: TextStyles.font16GrayRegular,) ,
                 onTap: () async{
                  final now = DateTime.now().toUtc().add(const Duration(hours: 2)); // Cairo is UTC+2
                  final initialTime = TimeOfDay(hour: now.hour, minute: now.minute);
                  final pickedTime = await showTimePicker(
                    context: context,
                    initialTime: initialTime,
                  );
                  if(pickedTime != null){
                     setState(() {
                   widget.controller.text = pickedTime.format(context).toString();
                 });
                  }
                 },
                  validator:widget.validator!,
                  inputTextStyle: TextStyles.font15BlackSemiBold,
                  type: TextInputType.none ,
                                
                 ),
               ),
               
               
            ],
          );
  }
}