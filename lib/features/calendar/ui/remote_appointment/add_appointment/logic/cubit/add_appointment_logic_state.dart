import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part  'add_appointment_logic_state.freezed.dart';

@freezed
class AddAppointmentLogicState with _$AddAppointmentLogicState {
  const factory AddAppointmentLogicState({
    @Default({}) Set<String> selectedGroupIds,
    @Default({}) Set<String> selectedUserIds,
    @Default([]) List<ReviewingEvtity> reviews,
  }) = _AddAppointmentLogicState;
}


