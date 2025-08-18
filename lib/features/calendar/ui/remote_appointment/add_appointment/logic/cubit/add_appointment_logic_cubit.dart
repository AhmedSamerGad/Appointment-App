import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/add_appointment/logic/cubit/add_appointment_logic_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/slider_widget.dart';
import 'package:appointments/features/groups/data/model/group_response/model/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAppointmentLogicCubit extends Cubit<AddAppointmentLogicState> {
  AddAppointmentLogicCubit() : super(const AddAppointmentLogicState());

final formKey =GlobalKey<FormState>();
final TextEditingController titleController =TextEditingController();
final TextEditingController startingTimeController =TextEditingController();
final TextEditingController endingTimeController =TextEditingController();
final TextEditingController noteConttrollar = TextEditingController();
final TextEditingController locationControllar = TextEditingController();
  List<String> selectedGroup = [];
  List<String> selectedUsers = [];
  List<RatingUser> ratings = [];

 
void initializeForEdit(AppointmentEntitiy appointment , context) {
  // Step 1: Text fields
  titleController.text = appointment.title;
  startingTimeController.text = appointment.startingTime.format(context);
  endingTimeController.text = appointment.endingTime?.format(context) ?? '';

  // Step 2: Group & User IDs
  selectedGroup = appointment.groupId ?? [];
  selectedUsers = appointment.attendance ?? [];

  emit(state.copyWith(
    selectedGroupIds: selectedGroup.toSet(),
    selectedUserIds: selectedUsers.toSet(),
  ));

  // Step 3: Rating (only for current logged-in user or first reviewer)
if (appointment.rating != null && appointment.rating!.isNotEmpty) {
final sharedReviews = appointment.rating!
    .expand((r) => r.ratedUsers).first.reviews.map((e) => ReviewingEvtity(
      title: e.title,
      points: e.points,
    )).toList();
    
    
  if (sharedReviews.isNotEmpty) {
    emit(state.copyWith(reviews: sharedReviews));
  } else {
    emit(state.copyWith(reviews: []));
  }
}
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

 

  void addReviw(ReviewingEvtity e) {
    final newList = [...state.reviews, e];
    emit(state.copyWith(reviews: newList));
  }

  void removeReview(ReviewingEvtity review) {
    final newList = [...state.reviews]..remove(review);
    emit(state.copyWith(reviews: newList));
  }

  List<RatingUser> get currentRatings => List.unmodifiable(ratings);

  @override
  Future<void> close() {
    titleController.dispose();
    endingTimeController.dispose();
    startingTimeController.dispose();
    locationControllar.dispose();
    noteConttrollar.dispose();
    
    return super.close();
  }
}
