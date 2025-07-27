import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/rating_logic/cubit/rate_users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RateUsersCubit extends Cubit<RateUsersState> {
  RateUsersCubit() : super(RateUsersState.initial());

  final commentControllar = TextEditingController();

  List<ReviewingEvtity> ratings = [];

  void setInitialRatings(List<ReviewingEvtity> initialRatings) {
    ratings =
        initialRatings
            .map(
              (r) => ReviewingEvtity(
                title: r.title,
                points: r.points,
                currentValue: 0, // start from 0
              ),
            )
            .toList();
    emit(RateUsersState(ratings: List.from(ratings), users: {}));
  }

   void updateSlider(String label, double value) {
    final newRatings = ratings.map((r) => 
      r.title == label ? r.copyWith(currentValue: value.toInt()) : r
    ).toList();
    
    ratings = newRatings;
    emit(state.copyWith(ratings: List.from(newRatings))); // New list instance
  }
Map<String,List<RatedUserEntity>> userRatings  = {};
    void setRateUser(String userId, RatedUserEntity rate) {
    final newUserRatings = {...userRatings};
    newUserRatings[userId] = [...newUserRatings[userId] ?? [], rate];
    
    userRatings = newUserRatings;
    emit(state.copyWith(users: Map.from(newUserRatings))); // New map instance
  }
  @override
  Future<void> close() {
    commentControllar.dispose();
    return super.close();
  }

}