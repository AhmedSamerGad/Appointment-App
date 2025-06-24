import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
    : super(
        CalendarState.initial(
          selectedDay: DateTime.now(),
          focusedDay: DateTime.now(),
        ),
        
      ){
        _initialRating();
      }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController startingTime = TextEditingController();
  final TextEditingController endingTime = TextEditingController();
  final formKey = GlobalKey<FormState>();

 List<RatingUser> ratings = [];
 void _initialRating(){
  ratings = [
    const RatingUser(label: 'Punctuality', value: 0),
      const RatingUser(label: 'Consistency', value: 0),
      const RatingUser(label: 'Quality of Work', value: 0),
      const RatingUser(label: 'Efficiency', value: 0),
      const RatingUser(label: 'x', value: 0),
      const RatingUser(label: 'y', value: 0),
      const RatingUser(label: 'i', value: 0),
      const RatingUser(label: 'c', value: 0),
      const RatingUser(label: 'p', value: 0),
      const RatingUser(label: 'a', value: 0),
      const RatingUser(label: 'l', value: 0),
      const RatingUser(label: 'k', value: 0),
      const RatingUser(label: 'p', value: 0),
      const RatingUser(label: 'm', value: 0),
  ];
 }

 void updateSlider(String label , double value){
  var index = ratings.indexWhere((r)=>r.label == label);
  if(index != -1){
    ratings[index] =ratings[index].copyWith( value: value) ;
  }
  emit(CalendarState.sliderChanged(value: value));
 }

  void onDaySelected(DateTime newSelectedDay , DateTime newFocuseDay) {
    emit(
      CalendarState.dayChanged(
        selectedDay: newSelectedDay,
        focusedDay: newFocuseDay,
      ),
    );
  }
 List<RatingUser> get currentRatings => List.unmodifiable(ratings);
}
