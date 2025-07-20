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
    emit(RateUsersState(ratings: List.from(ratings)));
  }

  void updateSlider(String label, double value) {
    final index = ratings.indexWhere((r) => r.title == label);
    if (index != -1) {
      ratings[index] = ratings[index].copyWith(currentValue: value.toInt());
      emit(RateUsersState(ratings: List.from(ratings))); // emit full new state
    }
  }

  @override
  Future<void> close() {
    commentControllar.dispose();
    return super.close();
  }
}
