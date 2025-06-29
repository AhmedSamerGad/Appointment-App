import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/logic/cubit/add_appointment_logic_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/slider_widget.dart';
import 'package:appointments/features/groups/data/model/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAppointmentLogicCubit extends Cubit<AddAppointmentLogicState> {
  AddAppointmentLogicCubit() : super(const AddAppointmentLogicState()) {
    _initialRating();
  }

final formKey =GlobalKey<FormState>();
final TextEditingController titleController =TextEditingController();
final TextEditingController startingTimeController =TextEditingController();
final TextEditingController endingTimeController =TextEditingController();
  List<String> selectedGroup = [];
  List<String> selectedUsers = [];
  List<RatingUser> ratings = [];

  void _initialRating() {
    ratings = [
      const RatingUser(label: 'Punctuality', value: 0),
      const RatingUser(label: 'Consistency', value: 0),
      const RatingUser(label: 'Quality of Work', value: 0),
      const RatingUser(label: 'Efficiency', value: 0),
    ];
  }

  void toggleGroup(GroupModel group) {
    final isSelected = state.selectedGroupIds.contains(group.id);
    final newSelectedGroup = Set<String>.from(state.selectedGroupIds);
    final newSelectedUsers = Set<String>.from(state.selectedUserIds);

    if (isSelected) {
      newSelectedGroup.remove(group.id);
      for (final user in group.members ?? []) {
        newSelectedUsers.remove(user.id);
      }
    } else {
      newSelectedGroup.add(group.id!);
      for (final user in group.members ?? []) {
        newSelectedUsers.add(user.id!);
      }
    }

    selectedGroup = newSelectedGroup.toList();

    emit(state.copyWith(
      selectedGroupIds: newSelectedGroup,
      selectedUserIds: newSelectedUsers,
    ));
  }

  void toggleUser(String userId) {
    final newSelectedUsers = Set<String>.from(state.selectedUserIds);
    if (newSelectedUsers.contains(userId)) {
      newSelectedUsers.remove(userId);
    } else {
      newSelectedUsers.add(userId);
    }

    selectedUsers = newSelectedUsers.toList();

    emit(state.copyWith(selectedUserIds: newSelectedUsers));
  }

  void updateSlider(String label, double value) {
    final index = ratings.indexWhere((r) => r.label == label);
    if (index != -1) {
      ratings[index] = ratings[index].copyWith(value: value);
    }
    emit(state.copyWith(sliderValue: value));
  }

  void addReviw(ReviewingEvtity e) {
    final newList = [...state.reviews, e];
    emit(state.copyWith(reviews: newList));
  }

  void removeReview(ReviewingEvtity review) {
    final newList = [...state.reviews]..remove(review);
    emit(state.copyWith(reviews: newList));
  }

  List<RatingUser> get currentRatings => List.unmodifiable(ratings);
}
