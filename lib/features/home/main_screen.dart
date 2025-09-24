import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/home/widgets/main_screen/build_task_card.dart';
import 'package:appointments/features/home/widgets/main_screen/tape_user_dates.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key, required this.controller});
  final AnimationController controller;
  final List<AppointmentEntitiy> app = [
    AppointmentEntitiy(
      title: 'Meeting with John',
      description: 'Discuss project updates and next steps.',
      startingDate: DateTime(2024, 06, 20),
      startingTime: const TimeOfDay(hour: 10, minute: 0),
      attendance: [],
      location: 'Office',
    ),
    AppointmentEntitiy(
      title: 'Dentist Appointment',
      description: 'Routine check-up and cleaning.',
      startingDate: DateTime(2024, 06, 21),
      startingTime: const TimeOfDay(hour: 14, minute: 30),
      attendance: [],
      location: 'Dental Clinic',
    ),
    AppointmentEntitiy(
      title: 'Lunch with Sarah',
      description: 'Catch up over lunch at the new cafe.',
      startingDate: DateTime(2024, 06, 22),
      startingTime: const TimeOfDay(hour: 12, minute: 0),
      attendance: [],
      location: 'Cafe Delight',
    ),
    AppointmentEntitiy(
      title: 'Gym Session',
      description: 'Workout session focusing on cardio and strength training.',
      startingDate: DateTime(2025, 09, 3),
      startingTime: const TimeOfDay(hour: 14, minute: 30),
      attendance: [],
      location: 'Local Gym',
    ),
    AppointmentEntitiy(
      title: 'Conference Call',
      description: 'Monthly team meeting to discuss progress and challenges.',
      startingTime: const TimeOfDay(hour: 9, minute: 0),
      startingDate: DateTime.now(),
      attendance: [],
      location: 'Online - Zoom',
    ),
  ];
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDrawerOpen = false;

  void toggleDrawer() {
    setState(() {
      if (isDrawerOpen) {
        widget.controller.reverse();
        isDrawerOpen = false;
      } else {
        widget.controller.forward();
        isDrawerOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDrawerOpen) {
          toggleDrawer();
        }
      },
      
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(-5, 0),
            ),
          ],
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: toggleDrawer,
            ),
            title: const Text(
              'Explore',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: const Row(
                  children: [
                    TapeUserDates(label: 'All Dates', isSelected: true),
                    SizedBox(width: 12),
                    TapeUserDates(label: 'Today', isSelected: false),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              BuildTaskCard(app: widget.app),
            ],
          ),
        ),
      ),
    );
  }

 
}
