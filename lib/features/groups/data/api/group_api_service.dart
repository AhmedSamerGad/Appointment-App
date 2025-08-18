import 'package:appointments/core/network/api_constant.dart';
import 'package:appointments/features/calendar/data/models/remote/appointments/response/appointment_response.dart';
import 'package:appointments/features/groups/data/api/group_api_constant.dart';
import 'package:appointments/features/groups/data/model/group_request/group_request.dart';
import 'package:appointments/features/groups/data/model/group_response/group_response.dart';
import 'package:appointments/features/groups/data/model/group_response/group_users/users_groups_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'group_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class GroupApiService {
  factory GroupApiService(Dio dio) {
    return _GroupApiService(dio); 
  }
  @GET(GroupApiEndPoints.getAdminGroups)
  Future<HttpResponse<GroupResponse>> getAdminGroups(@Path('id') String id);

  @PATCH(GroupApiEndPoints.updateGroupAdmin)
  Future<void> updateGroupAdmin(@Path('id') String id, @Body() String  adminId);
// it's take the user id from oauth
  @GET(GroupApiEndPoints.getUserGroups)
  Future<HttpResponse<GroupResponse>> getUserGroups();

  @POST(GroupApiEndPoints.createGroup)
  Future<void> createGroup(@Body() GroupRequest body);

  @PATCH(GroupApiEndPoints.updateGroup)
  Future<void> updateGroup(@Path('id') String id, @Body() GroupRequest body);

  @DELETE(GroupApiEndPoints.deleteGroup)
  Future<void> deleteGroup(@Path('id') String id);


// group members 
@GET(GroupApiEndPoints.getGroupMembers)
  Future<HttpResponse<UsersGroupsResponse>> getGroupMembers(@Path('id') String id);

  @POST(GroupApiEndPoints.addGroupMember)
  Future<void> addGroupMember(@Path('id') String id, @Body() List<String> userIds);

  @DELETE(GroupApiEndPoints.removeGroupMember)
  Future<void> removeGroupMember(@Path('id') String id, @Body() List<String> userIds);


  // group appointments
  @GET(GroupApiEndPoints.getGroupPosts)
  Future<HttpResponse<List<AppointmentResponseModel>>> getGroupPosts(@Path('id') String id);

  @POST(GroupApiEndPoints.acceptGroupPost)
  Future<void> acceptGroupPost(@Path('id') String appointmentId);

}
