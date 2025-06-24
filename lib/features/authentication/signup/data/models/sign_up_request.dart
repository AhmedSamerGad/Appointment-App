import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request.g.dart';
@JsonSerializable()
class SignUpRequest {
final String email;
final String password;
final String gender ;
final String name;

  SignUpRequest({required this.email, required this.password, required this.gender, required this.name});

  Map<String,dynamic> toJson() => _$SignUpRequestToJson(this);

}