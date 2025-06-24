import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'login_response.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponse {
  final String status;
  final LoginData data;

  LoginResponse({
    required this.status,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class LoginData {
  final UserModel user;

  LoginData({
    required this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
