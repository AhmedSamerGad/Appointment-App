// ignore_for_file: unnecessary_this

import 'package:appointments/features/calendar/data/models/remote/appointments/request/appointment_request_body.dart';
import 'package:appointments/features/calendar/domin/accepted_by_entity.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:flutter/material.dart';

class AppointmentEntitiy {
  final int? appointmentId;
  final String? mongoId;
  final String title;
  final String? userId;
  List<String>? groupId;
  final DateTime startingDate;
  DateTime? endingDate;
  TimeOfDay startingTime;
  TimeOfDay? endingTime;
  String status;
  List<String>? attendance;
  List<AcceptedByEntity>? acceptedBy;
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
    this.endingDate ,
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
  AppointmentRequestBody toModel() {
    return AppointmentRequestBody(
      title: title,
      startingDate:
          startingDate
              .toIso8601String()
              .split('T')
              .first, // Convert DateTime to String
      endingDate:
          endingDate
              ?.toIso8601String()
              .split('T')
              .first ?? null, // Convert DateTime to String
      startingTime:
          '${startingTime.hour}:${startingTime.minute}', // Convert TimeOfDay to String
      endingTime:
          endingTime != null
              ? '${endingTime!.hour}:${endingTime!.minute}' // Convert TimeOfDay to String
              : null,
      attendance: attendance ?? [],
      groupId: groupId,
       rating: rating!.expand((e) => e.ratedUsers)
          .expand((e) => e.reviews)
          .map((e) => ReviewingRequest(title: e.title, points: e.points))
          .toList(),
      location: location,
      description: description,
      
       
      
    );
  }

  AppointmentEntitiy copyWith({
    int? appointmentId,
    String? title,
    String? userId,
    List<String>? groupId,
    DateTime? startingDate,
    DateTime? endingDate,
    TimeOfDay? startingTime,
    TimeOfDay? endingTime,
    String? status,
    List<String>? attendance,
    List<AcceptedByEntity>? acceptedBy,
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
      attendance: attendance ?? this.attendance,
      acceptedBy: acceptedBy ,
      rating: rating ?? this.rating ,
      location: location ?? this.location,
      description: description ?? this.description,
    );
  }
}
