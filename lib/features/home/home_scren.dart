import 'package:appointments/features/groups/ui/out_side/group_view.dart';
import 'package:appointments/features/home/page_four.dart';
import 'package:flutter/material.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  bool showMenu = false;
  int selectedPageIndex = 0;

  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Widget> pages =  [
    AppointmentScreen(),
    ProfileScreen(),
    const GroupView(),
    SettingsScreen(),
  ];
 
  final List<String> pageNames = [
    "Appointments",
    "Profile",
    "Groups",
    "Settings",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
  }

  void toggleMenu() {
    setState(() => showMenu = !showMenu);
    showMenu ? _controller.forward() : _controller.reverse();
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
      toggleMenu();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          pages[selectedPageIndex],

          // Overlay grid with animation
          if (showMenu)
            Positioned.fill(
              child: FadeTransition(
                opacity: _animation,
                child: ScaleTransition(
                  scale: _animation,
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    padding: const EdgeInsets.all(24),
                    child: GridView.builder(
                      itemCount: pages.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => selectPage(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                pageNames[index],
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleMenu,
        child: Icon(showMenu ? Icons.close : Icons.menu),
      ),
    );
  }
}
