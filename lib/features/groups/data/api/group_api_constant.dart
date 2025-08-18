class GroupApiEndPoints{

// related to admin for many groups used when add appointment for many groups(user is admin of many groups)
  static const String getAdminGroups = '/group/{id}/admin-for';
  // related to get the current user groups
  static const String getUserGroups = '/group/';
  // related to group itself
  static const String createGroup = '/group/';
  static const String updateGroup = '/group/{id}';
  static const String deleteGroup = '/group/{id}';
  // related to group admin
  static const String getGroupAdmin = '/group/{id}/admin';
  static const String updateGroupAdmin = '/group/{id}/admin';
  // related to group members
  static const String getGroupMembers = '/group/{id}/users';
  static const String addGroupMember = '/group/{id}/users';
  // here it take array of user ids 
  static const String removeGroupMember = '/group/{id}/users';

  // related to group messages
  static const String getGroupPosts = '/group/{id}/appointment';
  static const String deleteGroupPost = '/group/{id}/appointment';

  // related to accept or reject group post 
  static const String acceptGroupPost = '/group/{id}/accept';  
  static const String getAppointmentForGroup = '/group/{id}/appointment'; 
  
}