import 'package:freezed_annotation/freezed_annotation.dart';
part  'local_calendar_state.freezed.dart';

@freezed
class LocalCalendarState<T> with _$LocalCalendarState<T> {
const factory LocalCalendarState.loading() = Loading;
  const factory LocalCalendarState.success(T data) = Success<T>;
  const factory LocalCalendarState.error(String message) = Error;
  }

