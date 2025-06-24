// user_entities.dart


import 'package:appointments/features/authentication/login/data/models/user_model.dart';

class UserEntities {
  final String id;
  final String? email;
  final String? password;
  final String? name;
  final String gender;
  final List<String> appointments;
  final List<String> groups;
  final String role;
  final String profilePic;
  final String? token ;

  UserEntities({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.gender,
    required this.appointments,
    required this.groups,
    required this.role,
    required this.profilePic,
    this.token
  });

  // Entity → Model
  UserModel toModel() {
    return UserModel(
      id: id,
      email: email,
      password: password,
      name: name,
      gender: gender,
      appointments: appointments,
      groups: groups,
      role: role,
      profilePic: profilePic,
      token: token
    );
  }
  
}
