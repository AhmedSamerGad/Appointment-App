// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalAppointmentModel _$LocalAppointmentModelFromJson(
  Map<String, dynamic> json,
) => LocalAppointmentModel(
  appointmentId: (json['appointmentId'] as num?)?.toInt(),
  title: json['title'] as String,
  startingDate: json['startingDate'] as String,
  endingDate: json['endingDate'] as String?,
  startingTime: json['startingTime'] as String,
  endingTime: json['endingTime'] as String?,
);

Map<String, dynamic> _$LocalAppointmentModelToJson(
  LocalAppointmentModel instance,
) => <String, dynamic>{
  'appointmentId': instance.appointmentId,
  'title': instance.title,
  'startingDate': instance.startingDate,
  'endingDate': instance.endingDate,
  'startingTime': instance.startingTime,
  'endingTime': instance.endingTime,
};
