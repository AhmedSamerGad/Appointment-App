import 'package:appointments/features/groups/data/model/group_response/model/group_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'group_response.g.dart';
@JsonSerializable()
class GroupResponse {
  final String status;
  final List<GroupModel> data;

  GroupResponse({
    required this.status,
    required this.data,
  });

  factory GroupResponse.fromJson(Map<String, dynamic> json) => _$GroupResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GroupResponseToJson(this);
}