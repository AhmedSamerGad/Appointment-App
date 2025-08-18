import 'package:appointments/features/groups/domin/groups_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListGroups extends StatelessWidget {
  const ListGroups({super.key, required this.groups});
  final List<GroupsEntities> groups;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
          elevation: 1.0,
          child: ListTile(
            title: Text(groups[index].name ?? 'unknown'),
            subtitle: const Text('Last message: "Namaste everyone!'),
            trailing: Container(
              width: 10.w,
              height: 10.h,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            leading: CircleAvatar(
              
              child: Image(
                image:
                    groups[index].groupPic != ""
                        ? NetworkImage(groups[index].groupPic ?? '')
                        : const AssetImage('assets/images/person.png')
                            as ImageProvider,
                fit: BoxFit.cover,
                width: 40.w,
                height: 40.h,
              ),
            ),
          
            onTap: () {
              // Action for tapping on a group
            },
          ),
        );
      },
    );
  }
}
