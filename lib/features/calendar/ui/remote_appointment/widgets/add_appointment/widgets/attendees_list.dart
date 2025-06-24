import 'package:flutter/material.dart';
import 'package:appointments/features/groups/data/model/group_model.dart';
import 'package:appointments/features/authentication/login/data/models/user_model.dart';

class GroupCardsList extends StatefulWidget {
  final List<GroupModel> groups;

  const GroupCardsList({super.key, required this.groups});

  @override
  State<GroupCardsList> createState() => _GroupCardsListState();
}

class _GroupCardsListState extends State<GroupCardsList> {
  final Set<String> expandedGroupIds = {}; // Store expanded group IDs

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.groups.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final group = widget.groups[index];
        final isExpanded = expandedGroupIds.contains(group.id);

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(group.groupPic ?? ""),
                ),
                title: Text(group.name ?? "No name"),
               
                trailing: IconButton(
                  icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      if (isExpanded) {
                        expandedGroupIds.remove(group.id);
                      } else {
                        expandedGroupIds.add(group.id!);
                      }
                    });
                  },
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: group.members?.map((user) => _buildUserTile(user)).toList() ?? [],
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  Widget _buildUserTile(UserModel user) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.profilePic ?? ''),
      ),
      title: Text(user.name ?? 'Unknown'),
      subtitle: Text(user.role ?? ''),
    );
  }
}
