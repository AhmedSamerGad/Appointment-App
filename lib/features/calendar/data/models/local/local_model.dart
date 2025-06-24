import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'local_model.g.dart';
@JsonSerializable()
class LocalAppointmentModel {
  final int? appointmentId;  // Make nullable
  final String title;
  final String startingDate;
  final String? endingDate;
  final String startingTime;  // Required
  final String? endingTime;

  LocalAppointmentModel({
    this.appointmentId,  // Make optional
    required this.title,
    required this.startingDate,
    this.endingDate,
    required this.startingTime,  // Required
    this.endingTime,
  });

  // ENTITY → MODEL
  factory LocalAppointmentModel.fromEntity(AppointmentEntitiy entity) {
    return LocalAppointmentModel(
      appointmentId: entity.appointmentId,  // Remove null check
      title: entity.title,
      startingDate: entity.startingDate.toIso8601String(),
      endingDate: entity.endingDate?.toIso8601String(),
      startingTime: '${entity.startingTime.hour.toString().padLeft(2, '0')}:${entity.startingTime.minute.toString().padLeft(2, '0')}',
      endingTime: entity.endingTime != null 
          ? '${entity.endingTime!.hour.toString().padLeft(2, '0')}:${entity.endingTime!.minute.toString().padLeft(2, '0')}'
          : null,
    );
  }

  // MODEL → ENTITY
  AppointmentEntitiy toEntity() {
    return AppointmentEntitiy(
      appointmentId: appointmentId,  // Pass as nullable
      title: title,
      userId: '0',
      startingDate: DateTime.parse(startingDate),
      endingDate: endingDate != null ? DateTime.parse(endingDate!) : null,
      startingTime: _parseTimeString(startingTime),
      endingTime: endingTime != null ? _parseTimeString(endingTime!) : null,
      attendance: const [],
      status: 'pending',
    );
  }

  // Helper method to parse time string
  TimeOfDay _parseTimeString(String timeStr) {
    final parts = timeStr.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  Map<String , dynamic> toJson() => _$LocalAppointmentModelToJson(this);
  factory LocalAppointmentModel.fromJson(Map<String , dynamic> json) => _$LocalAppointmentModelFromJson(json);
}