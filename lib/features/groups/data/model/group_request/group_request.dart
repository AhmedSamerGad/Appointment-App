import 'package:json_annotation/json_annotation.dart';
part 'group_request.g.dart';
@JsonSerializable()
class GroupRequest {
  final String ? name ;
  final String ? description ;
  final String ? groupPic;
  final List<String> ? members;
  final String ? adminId;

  GroupRequest(this.name, this.description, this.groupPic, this.members, this.adminId);

  Map<String, dynamic> toJson() => _$GroupRequestToJson(this);

  factory GroupRequest.fromEntity(GroupRequest entity) {
    return GroupRequest(
      entity.name,
      entity.description,
      entity.groupPic,
      entity.members,
      entity.adminId,
    );
  }
}