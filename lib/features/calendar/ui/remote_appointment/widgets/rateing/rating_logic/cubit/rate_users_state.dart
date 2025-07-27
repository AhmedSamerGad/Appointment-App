import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_users_state.freezed.dart';

@freezed
class RateUsersState with _$RateUsersState {
  
  const factory RateUsersState({
    required List<ReviewingEvtity> ratings,
    required Map <String,List<RatedUserEntity>> users,
  }) = _RateUsersState;

  factory RateUsersState.initial() => const RateUsersState(ratings: [] , users: {}) ;
}
