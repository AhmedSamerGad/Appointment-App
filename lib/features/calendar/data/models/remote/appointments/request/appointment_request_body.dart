import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_request_body.g.dart';

@JsonSerializable()
class AppointmentRequestBody {
  final String title;
  @JsonKey(name: 'group')
  final List<String>? groupId;
  @JsonKey(name: 'startingdate')
  final String startingDate;
  @JsonKey(name: 'endingdate')
  final String? endingDate;
  @JsonKey(name: 'startingtime')
  final String startingTime;
  @JsonKey(name: 'endingtime')
  final String? endingTime;
  final List<String> attendance;
  final String? location;
  final String? description;

  final List<ReviewingRequest> rating;

  AppointmentRequestBody({
    required this.title,
    this.groupId,
    required this.startingDate,
    this.endingDate,
    required this.startingTime,
    this.endingTime,
    required this.attendance,
    required this.rating,
    this.location,
    this.description,
  });

  Map<String, dynamic> toJson() => _$AppointmentRequestBodyToJson(this);

  factory AppointmentRequestBody.fromEntity(AppointmentEntitiy entity) {
    return AppointmentRequestBody(
      title: entity.title,
      groupId: entity.groupId,
      startingDate: entity.startingDate.toIso8601String().split('T').first,
      endingDate: entity.endingDate?.toIso8601String().split('T').first ,
      startingTime: formatTimeForBackend( entity.startingTime),
      endingTime:
          entity.endingTime != null
              ? formatTimeForBackend( entity.endingTime!)
              : null,
      attendance: entity.attendance ?? [],
      rating:
          entity.rating!
              .expand((r) => r.ratedUsers)
              .expand((ru) => ru.reviews)
              .map((e) => ReviewingRequest(title: e.title, points: e.points))
              .toList(),
      description: entity.description,
      location: entity.location,
    );
  }
static String formatTimeForBackend(TimeOfDay time) {
  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute'; // e.g. "09:00"
}
}

@JsonSerializable()
class ReviewingRequest {
  final String title;
  final int points;

  ReviewingRequest({required this.title, required this.points});

  factory ReviewingRequest.fromJson(Map<String, dynamic> json) =>
      _$ReviewingRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewingRequestToJson(this);
}
