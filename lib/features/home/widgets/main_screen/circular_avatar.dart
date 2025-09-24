import 'package:flutter/material.dart';

class CircularAvatarWidget extends StatelessWidget {
  const CircularAvatarWidget({super.key, required this.backgroundColor});
  final Color backgroundColor ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipOval(
        child: Container(
          color: backgroundColor,
          child: const Icon(Icons.person, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
