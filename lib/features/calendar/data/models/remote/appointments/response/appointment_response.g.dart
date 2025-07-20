// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponseModel _$AppointmentResponseModelFromJson(
  Map<String, dynamic> json,
) => AppointmentResponseModel(
  id: json['_id'] as String,
  title: json['title'] as String,
  user: json['user'] as String?,
  groupId:
      (json['group'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
  startingDate: json['startingdate'] as String,
  endingDate: json['endingdate'] as String?,
  startingTime: json['startingtime'] as String? ?? '',
  endingTime: json['endingtime'] as String? ?? '',
  status: json['status'] as String,
  attendance:
      (json['attendance'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  acceptedBy:
      (json['acceptedBy'] as List<dynamic>?)
          ?.map((e) => AcceptedByModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  rating:
      (json['rating'] as List<dynamic>?)
          ?.map((e) => RatingResponseModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  location: json['location'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$AppointmentResponseModelToJson(
  AppointmentResponseModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'user': instance.user,
  'group': instance.groupId,
  'startingdate': instance.startingDate,
  'endingdate': instance.endingDate,
  'startingtime': instance.startingTime,
  'endingtime': instance.endingTime,
  'status': instance.status,
  'attendance': instance.attendance,
  'acceptedBy': instance.acceptedBy,
  'rating': instance.rating,
  'location': instance.location,
  'description': instance.description,
};

AcceptedByModel _$AcceptedByModelFromJson(Map<String, dynamic> json) =>
    AcceptedByModel(
      name: json['name'] as String?,
      id: json['id'] as String?,
      imageUrl: json['profilePic'] as String? ?? '',
    );

Map<String, dynamic> _$AcceptedByModelToJson(AcceptedByModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'profilePic': instance.imageUrl,
    };
