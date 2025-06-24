import 'package:appointments/features/authentication/login/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable(createToJson: false)
class SignUpResponse {
  SignUpResponse({
    required this.status,
    required this.userData,
  });

  final String? status;
  @JsonKey(name: 'data')
  final Data? userData;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => _$SignUpResponseFromJson(json);

}

@JsonSerializable(createToJson: false)
class Data {
  Data({
    required this.user,
    required this.token,
  });

  final UserModel? user;
  final String? token;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

}
