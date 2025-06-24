// ignore_for_file: unnecessary_this

import 'package:appointments/features/authentication/domin/user_entities.dart';
import 'package:appointments/features/calendar/data/models/appointment_model.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:flutter/material.dart';

class AppointmentEntitiy {
  final int? appointmentId;
  final String? mongoId;
  final String title;
  final String? userId;
  String? groupId;
  final DateTime startingDate;
  DateTime? endingDate;
  TimeOfDay startingTime;
  TimeOfDay? endingTime;
  String status;
  List<UserEntities> attendance;
  List<UserEntities>? acceptedBy;
  List <ReviewEntity>? rating;
  String? location;
  String? description;

  AppointmentEntitiy({
    this.appointmentId,
    required this.title,
    this.mongoId,
    this.userId,
    this.groupId,
    required this.startingDate,
    this.endingDate,
    required this.startingTime,
    this.endingTime,
    this.status = 'pending',
    required this.attendance,
    this.acceptedBy,
    this.location,
    this.description,
     this.rating 
  });

  /// Convert `AppointmentEntitiy` to `AppointmentModel` for database storage
  AppointmentModel toModel() {
    return AppointmentModel(
      mongoId, // Convert int? to String
      title: title,
      userId: userId,
      startingDate:
          startingDate
              .toIso8601String()
              .split('T')
              .first, // Convert DateTime to String
      endingDate:
          endingDate
              ?.toIso8601String()
              .split('T')
              .first, // Convert DateTime to String
      startingTime:
          '${startingTime.hour}:${startingTime.minute}', // Convert TimeOfDay to String
      endingTime:
          endingTime != null
              ? '${endingTime!.hour}:${endingTime!.minute}' // Convert TimeOfDay to String
              : null,
      status: status,
      attendance: attendance.map((e) => AttendanceModel(
            attendanceId: e.id,
            email: e.email!,
            name: e.name!,
          )).toList(),
      acceptedBy: acceptedBy?.map((e) => e.toModel()).toList() ?? [],
      groupId: groupId, rating: rating!.map((e)=>e.toModel()).toList(),
      location: location,
      description: description,
      
       
      
    );
  }

  AppointmentEntitiy copyWith({
    int? appointmentId,
    String? title,
    String? userId,
    String? groupId,
    DateTime? startingDate,
    DateTime? endingDate,
    TimeOfDay? startingTime,
    TimeOfDay? endingTime,
    String? status,
    List<UserEntities>? attendance,
    List<UserEntities>? acceptedBy,
    List<ReviewEntity>? rating ,
    String? location,
    String? description,
  }) {
    return AppointmentEntitiy(
      appointmentId: appointmentId ?? this.appointmentId,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      groupId: groupId ?? this.groupId,
      startingDate: startingDate ?? this.startingDate,
      endingDate: endingDate ?? this.endingDate,
      startingTime: startingTime ?? this.startingTime,
      endingTime: endingTime ?? this.endingTime,
      status: status ?? this.status,
      attendance: attendance ?? List.from(this.attendance),
      acceptedBy: acceptedBy ?? (this.acceptedBy != null ? List.from(this.acceptedBy!) : null),
      rating: rating ?? this.rating ,
      location: location ?? this.location,
      description: description ?? this.description,
    );
  }
}
