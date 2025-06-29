// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      json['_id'] as String?,
      title: json['title'] as String?,
      userId: json['user'] as String?,
      groupId: json['group'] as String?,
      startingDate: json['startingdate'] as String,
      endingDate: json['endingdate'] as String?,
      startingTime: json['startingtime'] as String?,
      endingTime: json['endingtime'] as String?,
      status: json['status'] as String? ?? 'pending',
      attendance:
          (json['attendance'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      acceptedBy:
          (json['acceptedBy'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rating:
          (json['rating'] as List<dynamic>?)
              ?.map(
                (e) => RatingResponseModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      location: json['location'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      '_id': instance.mongoId,
      'title': instance.title,
      'user': instance.userId,
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

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    AttendanceModel(
      attendanceId: json['_id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AttendanceModelToJson(AttendanceModel instance) =>
    <String, dynamic>{
      '_id': instance.attendanceId,
      'email': instance.email,
      'name': instance.name,
    };
