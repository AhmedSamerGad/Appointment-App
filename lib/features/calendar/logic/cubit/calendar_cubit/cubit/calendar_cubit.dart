import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
    : super(
        CalendarState.initial(
          selectedDay: DateTime.now(),
          focusedDay: DateTime.now(),
        ),
        
      );

  final TextEditingController titleController = TextEditingController();
  final TextEditingController startingTime = TextEditingController();
  final TextEditingController endingTime = TextEditingController();
  final formKey = GlobalKey<FormState>();


  void onDaySelected(DateTime newSelectedDay , DateTime newFocuseDay) {
    print(newSelectedDay);
    emit(
      CalendarState.dayChanged(
        selectedDay: newSelectedDay,
        focusedDay: newFocuseDay,
      ),
    );
  }
}
