import 'package:appointments/features/authentication/login/data/models/user_model.dart';

class UsersGroupsResponse {
  final String? status;
  final List<UserModel>? users;

  UsersGroupsResponse(this.status, this.users);

  factory UsersGroupsResponse.fromJson(Map<String, dynamic> json) {
    return UsersGroupsResponse(
      json['status'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

 
}