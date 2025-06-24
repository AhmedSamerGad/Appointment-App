import 'package:appointments/core/network/api_result.dart';
import 'package:appointments/features/authentication/api/api_services.dart';
import 'package:appointments/features/authentication/signup/data/models/sign_up_request.dart';
import 'package:appointments/features/authentication/signup/data/models/sign_up_response.dart';

 class SignUpRepo {
final LoginApiServices _loginApiServices;

SignUpRepo(this._loginApiServices);


Future<ApiResult<SignUpResponse>> signUp (SignUpRequest signUpRequest)async{
  try{ final response = await _loginApiServices.signUp(signUpRequest);
   return ApiResult.success(response);}catch(e){
    return ApiResult.failure(e.toString());
   }
}
}