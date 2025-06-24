import 'package:appointments/features/authentication/domin/user_entities.dart';
import 'package:appointments/features/groups/data/model/group_model.dart';

class GroupsEntities {
  final String id;
  String name = '';
  final List<UserEntities>? members;
  final String? groupPic;
  final String? description;
  final String? admin;
  final List<String>? groupAppointments;

  GroupsEntities({
    required this.id,
    required this.name,
    this.members,
    this.groupPic,
    this.description,
    this.admin,
    this.groupAppointments,
  });
  GroupModel toModel() {
    return GroupModel(
      id: id,
      name: name,
      members: members!.map((e) => e.toModel()).toList(),
      groupPic: groupPic,
      groupAppointments: groupAppointments ?? [],
      admin: admin!,
      description: description,
    );
  }
}
