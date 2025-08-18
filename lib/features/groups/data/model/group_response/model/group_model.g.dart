// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) => GroupModel(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  members:
      (json['members'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  groupPic: json['groupPic'] as String?,
  description: json['description'] as String?,
  admin:
      json['admin'] == null
          ? null
          : UserModel.fromJson(json['admin'] as Map<String, dynamic>),
  groupAppointments:
      (json['Appointments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
);

Map<String, dynamic> _$GroupModelToJson(GroupModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'members': instance.members,
      'groupPic': instance.groupPic,
      'description': instance.description,
      'admin': instance.admin,
      'Appointments': instance.groupAppointments,
    };
