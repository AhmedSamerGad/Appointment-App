
import 'package:appointments/features/groups/data/repo/group_repo.dart';
import 'package:appointments/features/groups/domin/groups_entities.dart';
import 'package:appointments/features/groups/logic/cubit/group_api_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupApiCubit extends Cubit<GroupApiState> {
  GroupApiCubit(this._groupRepo) : super(const GroupApiState.initial());
  final GroupRepo _groupRepo;
  List<GroupsEntities> userGroups = [];
  void getUserGroups() async {
    emit(const GroupApiState.loading());
    final result = await _groupRepo.getUserGroups();
    result.when(success: (data) {
      userGroups = data;
      emit(GroupApiState.loaded(data));
    }, failure: (error) {
      emit(GroupApiState.error(error));
    });
  }

  void getGroupPosts(String groupId) async {
    emit(const GroupApiState.loading());
    final result = await _groupRepo.getGroupPosts(groupId);
    result.when(success: (data) {
      emit(GroupApiState.loaded(data));
    }, failure: (error) {
      emit(GroupApiState.error(error));
    });
  }

  void acceptGroupPost(String postId) async {
    emit(const GroupApiState.loading());
    final result = await _groupRepo.acceptGroupPost(postId);
    result.when(success: (_) {
      emit(const GroupApiState.loaded(null));
    }, failure: (error) {
      emit(GroupApiState.error(error));
    });
  }

  void createGroup(GroupsEntities group) async {
    emit(const GroupApiState.loading());
    final result = await _groupRepo.createGroup(group);
    result.when(success: (_) {
      emit(const GroupApiState.loaded(null));
    }, failure: (error) {
      emit(GroupApiState.error(error));
    });
  }
  void updateGroup(String groupId, GroupsEntities group) async {
    emit(const GroupApiState.loading());
    final result = await _groupRepo.updateGroup(groupId, group);
    result.when(success: (_) {
      emit(const GroupApiState.loaded(null));
    }, failure: (error) {
      emit(GroupApiState.error(error));
    });
  }

  void deleteGroup (String groupId) async {
    emit(const GroupApiState.loading());
    final result = await _groupRepo.deleteGroup(groupId);
    result.when(success: (_) {
      emit(const GroupApiState.loaded(null));
    }, failure: (error) {
      emit(GroupApiState.error(error));
    });
  }
  void updateGroupAdmin(String groupId, String adminId) async {
    emit(const GroupApiState.loading());
    final result = await _groupRepo.updateGroupAdmin(groupId, adminId);
    result.when(success: (_) {
      emit(const GroupApiState.loaded(null));
    }, failure: (error) {
      emit(GroupApiState.error(error));
    });
  }

  void addGroupMember(String groupId, List<String> userIds) async {
    emit(const GroupApiState.loading());
    final result = await _groupRepo.addGroupMember(groupId, userIds);
    result.when(success: (_) {
      emit(const GroupApiState.loaded(null));
    }, failure: (error) {
      emit(GroupApiState.error(error));
    });
  }
   void getGroupMembers(String groupId) async {
    emit(const GroupApiState.loading());
    final result = await _groupRepo.getGroupMembers(groupId);
    result.when(success: (data) {
      emit(GroupApiState.loaded(data));
    }, failure: (error) {
      emit(GroupApiState.error(error));
    });
  }

  void removeGroupMember(String groupId, List<String> userIds) async {
    emit(const GroupApiState.loading());
    final result = await _groupRepo.removeGroupMember(groupId, userIds);
    result.when(success: (_) {
      emit(const GroupApiState.loaded(null));
    }, failure: (error) {
      emit(GroupApiState.error(error));
    });
  }

}
