import 'package:appointments/features/authentication/domin/user_entities.dart';
import 'package:appointments/features/authentication/login/data/models/user_model.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:appointments/features/calendar/data/models/remote/rating/rating_response_model.dart';
part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  @JsonKey(name: '_id')
  final String? mongoId;
  final String? title;
  @JsonKey(name: 'user')
  final String? userId;
  @JsonKey(name: 'group')
  String? groupId;
  @JsonKey(name: 'startingdate')
  final String startingDate;
  @JsonKey(name: 'endingdate')
  String? endingDate;
  @JsonKey(name: 'startingtime')
  String? startingTime;
  @JsonKey(name: 'endingtime')
  String? endingTime;
  String? status;
  @JsonKey(defaultValue: [])
  List<String> attendance;
  @JsonKey(defaultValue: [])
  List<UserModel>? acceptedBy;
  @JsonKey(defaultValue: [])
  List<RatingResponseModel> rating ;
  String ? location;
  String ? description;



  AppointmentModel(
    this.mongoId, {
    required this.title,
    required this.userId,
    this.groupId,
    required this.startingDate,
    this.endingDate,
    this.startingTime,
    this.endingTime,
    this.status = 'pending',
    this.attendance = const [],
    this.acceptedBy = const [],
    required this.rating,
    this.location,
    this.description,
  });
 AppointmentEntitiy toEntitiy() {
  return AppointmentEntitiy(
    mongoId: mongoId,
    title: title ?? 'No Title',
    userId: userId ?? '',
    startingDate: DateTime.parse(startingDate).toLocal(),
    endingDate: endingDate != null ? DateTime.parse(endingDate!).toLocal() : null,
    startingTime: startingTime != null 
        ? TimeOfDay(
            hour: int.parse(startingTime!.split(':')[0]),
            minute: int.parse(startingTime!.split(':')[1]),
          )
        : TimeOfDay.now(),
    endingTime: endingTime != null
        ? TimeOfDay(
            hour: int.parse(endingTime!.split(':')[0]),
            minute: int.parse(endingTime!.split(':')[1]),
          )
        : null,
    attendance: attendance,
    acceptedBy: acceptedBy?.map((e) => e.toEntity()).toList() ?? [],
    rating: rating.map((e)=>e.toEntity()).toList(),
    location: location ?? '',
    description: description ?? '',
  );
}
    factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}

@JsonSerializable()
class AttendanceModel {
  @JsonKey(name : '_id')
  final String attendanceId;
  final String email;
  final String name;

  AttendanceModel({required this.attendanceId, required this.email, required this.name});

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);
  Map<String, dynamic> toJson() => _$AttendanceModelToJson(this);
  UserEntities toEntity() {
    return UserEntities(
      id: attendanceId,
      email: email,
      name: name, password: '', gender: '', appointments: [], groups: [], role: '', profilePic: '',
    );
  }
  
}
