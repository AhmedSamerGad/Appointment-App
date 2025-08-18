import 'package:appointments/features/authentication/domin/user_entities.dart';
import 'package:appointments/features/groups/data/model/group_request/group_request.dart';

class GroupsEntities {
  final String? id;
  final String? name ;
  final List<UserEntities>? members;
  final String? groupPic;
  final String? description;
  final UserEntities? admin;
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
  // GroupModel toModel() {
  //   return GroupModel(
  //     id: id,
  //     name: name,
  //     members: members!.map((e) => e.toModel()).toList(),
  //     groupPic: groupPic,
  //     groupAppointments: groupAppointments ?? [],
  //     admin: admin?.toModel(),
  //     description: description,
  //   );
  // }

  GroupRequest toModelRequest() {
    return GroupRequest(
      name ,
      description,
      groupPic,
      members?.map((e) => e.id).toList(),
      admin?.id,
    );
  }
}
