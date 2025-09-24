import 'package:flutter/material.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  final String route = '/home'; // Example route, replace with actual routes

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, route );
        },
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}