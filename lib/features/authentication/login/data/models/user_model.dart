// user_model.dart
import 'package:appointments/features/authentication/domin/user_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? gender;
  @JsonKey(defaultValue: [])
  final List<String>? appointments;
  @JsonKey(defaultValue: [])
  final List<String>? groups;
  final String? role;
  final String? profilePic;
  final String? token;

  UserModel({
    this.token,
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.gender,
    this.appointments = const [],
    this.groups = const [],
    required this.role,
    required this.profilePic,
  });

  // Model → Entity
  UserEntities toEntity() {
    return UserEntities(
      id: id!,
      email: email!,
      password: password!,
      name: name!, 
      gender: gender!,
      appointments: appointments!,
      groups: groups!,
      role: role!,
      profilePic: profilePic!,
      token: token
    );
  }

  // JSON serialization
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
