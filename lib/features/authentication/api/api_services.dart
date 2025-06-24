import 'package:appointments/core/network/api_constant.dart';
import 'package:appointments/features/authentication/api/auth_constant.dart';
import 'package:appointments/features/authentication/login/data/models/login_response.dart';
import 'package:appointments/features/authentication/signup/data/models/sign_up_request.dart';
import 'package:appointments/features/authentication/signup/data/models/sign_up_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../login/data/models/login_request.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class LoginApiServices {
 factory LoginApiServices(Dio dio) {
    // ignore: avoid_print
    print('LoginApiServices Base URL: ${dio.options.baseUrl}'); // Debug print
    return _LoginApiServices(dio);
  }

  @POST(AuthenticationConstant.login)
  Future<LoginResponse>? login(@Body() LoginRequestBody loginRequestBody);

  @POST(AuthenticationConstant.signUp) 
  Future<SignUpResponse> signUp (
    @Body() SignUpRequest signUpRequest 
  );
  
}
