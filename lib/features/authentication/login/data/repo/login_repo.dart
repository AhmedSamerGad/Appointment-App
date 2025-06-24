import 'package:appointments/core/network/api_result.dart';
import 'package:appointments/features/authentication/api/api_services.dart';
import 'package:appointments/features/authentication/domin/user_entities.dart';
import 'package:appointments/features/authentication/login/data/models/login_request.dart';

class LoginRepo {
  final LoginApiServices _loginApiServices;

  LoginRepo(this._loginApiServices);
  Future<ApiResult<UserEntities>> login(LoginRequestBody loginRequest) async {
    try {
      final response = await _loginApiServices.login(loginRequest);
     final date= response?.data.user.toEntity();
      return response!=null ? ApiResult.success(date!) : const ApiResult.failure('some thing go wrong');
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
