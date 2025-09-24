// ignore_for_file: library_private_types_in_public_api

import 'package:appointments/features/home/widgets/animation_effect.dart';
import 'package:appointments/features/home/widgets/drawer_items.dart';
import 'package:appointments/features/home/main_screen.dart';
import 'package:flutter/material.dart';

class ThreeDDrawerDemo extends StatefulWidget {
  const ThreeDDrawerDemo({super.key});

  @override
  _ThreeDDrawerDemoState createState() => _ThreeDDrawerDemoState();
}

class _ThreeDDrawerDemoState extends State<ThreeDDrawerDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final drawerWidth = screenWidth * 0.65;

    return Scaffold(
      body: Stack(
        children: [
          // Drawer Background
          Container(
            width: drawerWidth,
            color: const Color(0xFF4A90E2),
            child: const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    // Profile Section
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face'),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Chanandler Bong',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 40),
                    // Menu Items
                    DrawerItems(icon: Icons.person_outline, title: 'Profile'),
                    DrawerItems(icon: Icons.shopping_cart_outlined, title: 'My Cart'),
                    DrawerItems(icon: Icons.favorite_border, title: 'Favourite'),
                    DrawerItems(icon: Icons.receipt_long, title: 'Orders'),
                    DrawerItems(icon: Icons.notifications_outlined, title: 'Notifications'),
                    DrawerItems(icon: Icons.settings_outlined, title: 'Settings'),
                    Spacer(),
                    DrawerItems(icon: Icons.logout, title: 'Sign Out'),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          
          // Main Content with 3D Transform
          AnimationEffect(
            controller: _controller,
            drawerWidth: drawerWidth,
            child: MainScreen(controller: _controller,),
          ),

        ],
      ),
    );
  }
}