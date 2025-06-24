import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.dateControllar, this.title});
  final TextEditingController dateControllar;
  final String? title;
  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final dateFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.dateControllar,
      label: Text(widget.title!, style: TextStyles.font14DarkBlueMedium),
      validator: (value) {
        if (value!.isNotEmpty) {
        
        try {
          DateTime.parse(value);
          return null;
        } catch (e) {
          return 'Invalid date format';
        }}
      },
      type: TextInputType.none,
      inputTextStyle: TextStyles.font15BlackSemiBold,
      onTap: () async {
        final DateTime initialDate = widget.dateControllar.text.isNotEmpty 
            ? DateTime.parse(widget.dateControllar.text)
            : DateTime.now();

        final DateTime? pickedDate = await showDatePicker(
          context: context,
          firstDate: DateTime(2025),
          lastDate: DateTime(2030),
          initialDate: initialDate,
          initialEntryMode: DatePickerEntryMode.calendar,
          
        );

        if (pickedDate != null) {
          setState(() {
            widget.dateControllar.text = dateFormat.format(pickedDate);
          });
        }
      },
    );
  }
}