// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentResponce _$AppointmentResponceFromJson(Map<String, dynamic> json) =>
    AppointmentResponce(
      status: json['status'] as String?,
      appointmentData:
          (json['data'] as List<dynamic>)
              .map((e) => AppointmentModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      result: (json['result'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AppointmentResponceToJson(
  AppointmentResponce instance,
) => <String, dynamic>{
  'status': instance.status,
  'data': instance.appointmentData,
  'result': instance.result,
};
