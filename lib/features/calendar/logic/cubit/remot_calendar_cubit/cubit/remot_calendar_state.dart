
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'remot_calendar_state.freezed.dart';
@freezed
class RemotCalendarState<T> with _$RemotCalendarState<T> {
  const factory RemotCalendarState.remoteLoading() = remote_Loading;
  const factory RemotCalendarState.remoteSuccess(T data) = remote_Success<T>;
  const factory RemotCalendarState.remoteError(String error) = remote_Error;
  const factory RemotCalendarState.remoteDayChange(List<AppointmentEntitiy> days , DateTime selectedDay) = remote_Change;
}
