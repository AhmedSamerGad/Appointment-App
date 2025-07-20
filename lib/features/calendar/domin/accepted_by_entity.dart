import 'package:appointments/features/calendar/data/models/remote/appointments/response/appointment_response.dart';

class AcceptedByEntity {
  final String name;
  final String id;
  final String imageUrl;

  AcceptedByEntity({
    required this.name,
    required this.id,
    this.imageUrl = '',
  });

  factory AcceptedByEntity.fromModel(AcceptedByModel model) {
    return AcceptedByEntity(
      name: model.name ?? '',
      id: model.id ?? '',
      imageUrl: model.imageUrl,
    );
  }
}