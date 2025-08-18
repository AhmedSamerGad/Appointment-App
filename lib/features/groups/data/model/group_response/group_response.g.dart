// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupResponse _$GroupResponseFromJson(Map<String, dynamic> json) =>
    GroupResponse(
      status: json['status'] as String,
      data:
          (json['data'] as List<dynamic>)
              .map((e) => GroupModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$GroupResponseToJson(GroupResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
