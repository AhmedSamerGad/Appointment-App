import 'package:appointments/core/network/api_result.dart';
import 'package:appointments/features/groups/data/api/group_api_service.dart';
import 'package:appointments/features/groups/data/model/group_model.dart';

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
      return ApiResult.failure("Failed with status: ${response.response.statusCode}");
    }
  } catch (error) {
    return ApiResult.failure(error.toString());
  }
}
}