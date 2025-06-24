// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  token: json['token'] as String?,
  id: json['_id'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  name: json['name'] as String?,
  gender: json['gender'] as String?,
  appointments:
      (json['appointments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  groups:
      (json['groups'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  role: json['role'] as String?,
  profilePic: json['profilePic'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  '_id': instance.id,
  'email': instance.email,
  'password': instance.password,
  'name': instance.name,
  'gender': instance.gender,
  'appointments': instance.appointments,
  'groups': instance.groups,
  'role': instance.role,
  'profilePic': instance.profilePic,
  'token': instance.token,
};
