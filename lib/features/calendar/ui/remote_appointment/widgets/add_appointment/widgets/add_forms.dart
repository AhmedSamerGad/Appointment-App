import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:appointments/features/calendar/ui/local_appointment/add_appointment/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddForms extends StatelessWidget {
   const AddForms({super.key, this.formKey, required this.titleController, required this.startingTimeController, required this.endingTimeController});
final formKey ;
final TextEditingController titleController ;
final TextEditingController startingTimeController ;
final TextEditingController endingTimeController ;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 12.h,
        children: [
          AppTextFormField(
            validator: (value) {
              if(value == null || value.isEmpty) {
                return 'Please enter a title';
              }
            },
            label: Text('Title', style: TextStyles.font13DarkBlueRegular),
            backgroundColor: Colors.white,
            controller: titleController,      
            suffixIcon: const Icon(
              Icons.calendar_today_outlined,
              color: ColorsManager.ofBlack,
            ),
            contentPadding: const EdgeInsets.all(16.0),
          ),
          Row(
            spacing: 8.w,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: TimePicker(
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Please select a starting time';
                    }
                  },
                  controller: startingTimeController,
                  title: 
                    'Starting Time',
                 
                ),
              ),
              Expanded(
                flex: 1,
                child: TimePicker(
                  validator: (value) {},
                  controller: endingTimeController,
                  title: 
                    'Ending Time'
                ),
              ),
            ],
          ),
         
        ],
      ),
    );
  }
}
