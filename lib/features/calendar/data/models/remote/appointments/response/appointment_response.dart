import 'package:appointments/features/calendar/data/models/remote/rating/rating_response/rating_response_model.dart';
import 'package:appointments/features/calendar/domin/accepted_by_entity.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'appointment_response.g.dart';
@JsonSerializable()
class AppointmentResponseModel {
  @JsonKey(name: '_id')
  final String id;
  final String title;

  @JsonKey(name: 'user')
  final String? user;

  @JsonKey(name: 'group', defaultValue: [])
  final List<String> groupId;

  @JsonKey(name: 'startingdate')
  final String startingDate;

  @JsonKey(name: 'endingdate')
  final String? endingDate;

  @JsonKey(name: 'startingtime', defaultValue: '')
  final String startingTime;

  @JsonKey(name: 'endingtime', defaultValue: '')
  final String endingTime;

  final String status;

  @JsonKey(defaultValue: [])
  final List<String> attendance;

  @JsonKey(defaultValue: [])
  final List<AcceptedByModel> acceptedBy;

  @JsonKey(defaultValue: [])
  final List<RatingResponseModel> rating;

  final String? location;
  final String? description;

  AppointmentResponseModel({
    required this.id,
    required this.title,
    required this.user,
    required this.groupId,
    required this.startingDate,
    required this.endingDate,
    required this.startingTime,
    required this.endingTime,
    required this.status,
    required this.attendance,
    required this.acceptedBy,
    required this.rating,
    required this.location,
    required this.description,
  });

  factory AppointmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentResponseModelToJson(this);

  TimeOfDay? parseTime(String? time) {
  if (time == null || time.isEmpty || !time.contains(':')) return null;
  final parts = time.split(':');
  if (parts.length != 2) return null;
  final hour = int.tryParse(parts[0]);
  final minute = int.tryParse(parts[1]);
  if (hour == null || minute == null) return null;
  return TimeOfDay(hour: hour, minute: minute);
}

  AppointmentEntitiy toEntity() {
    return AppointmentEntitiy(
      mongoId: id,
      title: title,
      userId: user ?? '',
      groupId: groupId,
      startingDate: DateTime.parse(startingDate),
      endingDate: endingDate != null ? DateTime.parse(endingDate!) : null,
      startingTime: parseTime(startingTime) ?? const TimeOfDay(hour: 0, minute: 0),
      endingTime: parseTime(endingTime),
      status: status,
      attendance: attendance,
      acceptedBy: acceptedBy.map((e)=> AcceptedByEntity(
        name: e.name ?? '',
        id: e.id ?? '',
        imageUrl: e.imageUrl,
      )).toList(),
      rating: rating.map((e) => e.toEntity()).toList(),
      location: location,
      description: description,
    );
  }
}
@JsonSerializable()
class AcceptedByModel {
  final String? name ; 
  final String? id;
  @JsonKey(name: 'profilePic',defaultValue: '')
  final String imageUrl;

  AcceptedByModel({required this.name, required this.id, required this.imageUrl});

  factory AcceptedByModel.fromJson(Map<String, dynamic> json) => _$AcceptedByModelFromJson(json);
  Map<String, dynamic> toJson() => _$AcceptedByModelToJson(this);
}
