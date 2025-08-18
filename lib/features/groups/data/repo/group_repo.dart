import 'package:appointments/core/network/api_result.dart';
import 'package:appointments/features/authentication/domin/user_entities.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/groups/data/api/group_api_service.dart';
import 'package:appointments/features/groups/data/model/group_response/model/group_model.dart';
import 'package:appointments/features/groups/domin/groups_entities.dart';

class GroupRepo {
  final GroupApiService _groupApiService;

  GroupRepo(this._groupApiService);

  Future<ApiResult<List<GroupModel>>> getAdminAllGroups(String userId) async {
    try {
      // Inject Dio from outside in real apps
      final response = await _groupApiService.getAdminGroups(userId);

      if (response.response.statusCode == 200) {
        final List<GroupModel> groups = response.data.data;
        return ApiResult.success(groups);
      } else {
        return ApiResult.failure(
          "Failed with status: ${response.response.statusCode}",
        );
      }
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<void>> updateGroupAdmin(
    String groupId,
    String adminId,
  ) async {
    try {
      await _groupApiService.updateGroupAdmin(groupId, adminId);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<void>> createGroup(GroupsEntities body) async {
    try {
      final groupRequest = body.toModelRequest();
      await _groupApiService.createGroup(groupRequest);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<List<GroupsEntities>>> getUserGroups() async {
    try {
      final response = await _groupApiService.getUserGroups();

      if (response.response.statusCode == 200) {
        print(response.data); // is this null?
        print(response.data.data);
        final List<GroupsEntities> groups =
            response.data.data.map((e) => e.toEntitiy()).toList();
        // is this null?

        return ApiResult.success(groups);
      } else {
        return ApiResult.failure(
          "Failed with status: ${response.response.statusCode}",
        );
      }
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<void>> updateGroup(String id, GroupsEntities body) async {
    try {
      final groupRequest = body.toModelRequest();
      await _groupApiService.updateGroup(id, groupRequest);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<void>> deleteGroup(String id) async {
    try {
      await _groupApiService.deleteGroup(id);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<List<UserEntities>>> getGroupMembers(String groupId) async {
    try {
      final response = await _groupApiService.getGroupMembers(groupId);

      if (response.response.statusCode == 200) {
        final List<UserEntities> groups =
            response.data.users!
                .map((toElement) => toElement.toEntity())
                .toList();
        return ApiResult.success(groups);
      } else {
        return ApiResult.failure(
          "Failed with status: ${response.response.statusCode}",
        );
      }
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<void>> addGroupMember(
    String groupId,
    List<String> userIds,
  ) async {
    try {
      await _groupApiService.addGroupMember(groupId, userIds);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<void>> removeGroupMember(
    String groupId,
    List<String> userIds,
  ) async {
    try {
      await _groupApiService.removeGroupMember(groupId, userIds);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<List<AppointmentEntitiy>>> getGroupPosts(
    String groupId,
  ) async {
    try {
      final response = await _groupApiService.getGroupPosts(groupId);

      if (response.response.statusCode == 200) {
        final List<AppointmentEntitiy> appointments =
            response.data.map((e) => e.toEntity()).toList();
        return ApiResult.success(appointments);
      } else {
        return ApiResult.failure(
          "Failed with status: ${response.response.statusCode}",
        );
      }
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<void>> acceptGroupPost(String appointmentId) async {
    try {
      await _groupApiService.acceptGroupPost(appointmentId);
      return const ApiResult.success(null);
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }
}
