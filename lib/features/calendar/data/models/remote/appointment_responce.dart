import 'package:appointments/features/calendar/data/models/appointment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'appointment_responce.g.dart';

@JsonSerializable()
class AppointmentResponce {
    AppointmentResponce({
        required this.status,
        required this.appointmentData,
        this.result
    });

    final String? status;
    @JsonKey(name:'data' )
    final List<AppointmentModel> appointmentData;
    final int ? result;

    factory AppointmentResponce.fromJson(Map<String, dynamic> json) => _$AppointmentResponceFromJson(json);

    Map<String, dynamic> toJson() => _$AppointmentResponceToJson(this);

    

}

