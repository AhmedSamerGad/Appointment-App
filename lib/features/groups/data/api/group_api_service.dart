
import 'package:appointments/core/network/api_constant.dart';
import 'package:appointments/features/groups/data/api/group_api_constant.dart';
import 'package:appointments/features/groups/data/model/group_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'group_api_service.g.dart';
@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class GroupApiService {
  factory GroupApiService (Dio dio){
    return _GroupApiService(dio);
  }
@GET(GroupApiEndPoints.getAdminGroups)
Future<HttpResponse<GroupResponse>> getAdminGroups (@Path('id') String id);}