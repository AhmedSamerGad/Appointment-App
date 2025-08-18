// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentRequestBody _$AppointmentRequestBodyFromJson(
  Map<String, dynamic> json,
) => AppointmentRequestBody(
  title: json['title'] as String,
  groupId: (json['group'] as List<dynamic>?)?.map((e) => e as String).toList(),
  startingDate: json['startingdate'] as String,
  endingDate: json['endingdate'] as String?,
  startingTime: json['startingtime'] as String,
  endingTime: json['endingtime'] as String?,
  attendance:
      (json['attendance'] as List<dynamic>).map((e) => e as String).toList(),
  rating:
      (json['rating'] as List<dynamic>)
          .map((e) => ReviewingRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
  location: json['location'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$AppointmentRequestBodyToJson(
  AppointmentRequestBody instance,
) => <String, dynamic>{
  'title': instance.title,
  'group': instance.groupId,
  'startingdate': instance.startingDate,
  'endingdate': instance.endingDate,
  'startingtime': instance.startingTime,
  'endingtime': instance.endingTime,
  'attendance': instance.attendance,
  'location': instance.location,
  'description': instance.description,
  'rating': instance.rating,
};

ReviewingRequest _$ReviewingRequestFromJson(Map<String, dynamic> json) =>
    ReviewingRequest(
      title: json['title'] as String,
      points: (json['points'] as num).toInt(),
    );

Map<String, dynamic> _$ReviewingRequestToJson(ReviewingRequest instance) =>
    <String, dynamic>{'title': instance.title, 'points': instance.points};
