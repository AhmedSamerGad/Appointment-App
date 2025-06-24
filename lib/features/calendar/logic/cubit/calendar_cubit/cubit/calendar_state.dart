import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState.initial({
    required DateTime selectedDay,
    required DateTime focusedDay,
  }) = _Initial;

  const factory CalendarState.dayChanged({
    required DateTime selectedDay,
    required DateTime focusedDay,
  }) = _DayChanged;
  const factory CalendarState.sliderChanged({
    required double value,
  }) = _SliderChanged;
}
