// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as String,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

LoginData _$LoginDataFromJson(Map<String, dynamic> json) =>
    LoginData(user: UserModel.fromJson(json['user'] as Map<String, dynamic>));
