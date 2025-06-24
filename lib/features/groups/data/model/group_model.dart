import 'package:appointments/features/authentication/login/data/models/user_model.dart';
import 'package:appointments/features/groups/domin/groups_entities.dart';
import 'package:json_annotation/json_annotation.dart';
part 'group_model.g.dart';

@JsonSerializable()
class GroupModel  {
 GroupModel({
    required this.id,
    required this.name, 
   this.members = const [],
    this.groupPic,
    this.description, 
    this.admin,
    this.groupAppointments = const []});
@JsonKey(name:'_id')
final String? id;
   String? name ='';
@JsonKey(defaultValue: [])
  final List <UserModel>? members;
  final String? groupPic ;
  final String ?description ; 
  final String? admin ;
   @JsonKey(name:'Appointments',defaultValue: [])
  final List<String>? groupAppointments;

factory GroupModel.fromJson(Map<String,dynamic> json) => _$GroupModelFromJson(json);

Map<String , dynamic> toJson () => _$GroupModelToJson(this);

GroupsEntities toEntitiy(){
  return GroupsEntities(id: id!, name: name! , admin: admin , description: description ,
  groupAppointments: groupAppointments,members: members!.map((e)=>e.toEntity()).toList());
}

}