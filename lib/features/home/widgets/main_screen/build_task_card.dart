import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/home/widgets/main_screen/circular_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTaskCard extends StatelessWidget {
  const BuildTaskCard({super.key, required this.app});
  final List<AppointmentEntitiy> app;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: SizedBox(
        height: 340.h, // Ensure the height is sufficient for the Stack
        width: double.infinity, // Allow the Stack to expand horizontally
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topLeft,
          children: [
            // Stacked containers
            for (int i = 0; i < 3; i++)
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.translationValues(0, i * 25.h, 12)
                  ..rotateZ(i * .02),
                child: Container(
                  width: double.infinity,
                  height: 280.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(i * 0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top row with time and avatars
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Time container
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.white.withOpacity(0.9),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    app[i]
                                        .startingTime
                                        .format(context)
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Stacked avatars
                            SizedBox(
                              width: 90,
                              height: 40,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 0,
                                    child: CircularAvatarWidget(
                                      backgroundColor: Colors.brown[300]!,
                                    ),
                                  ),
                                  Positioned(
                                    right: 18,
                                    child: CircularAvatarWidget(
                                      backgroundColor: Colors.grey[400]!,
                                    ),
                                  ),
                                  Positioned(
                                    right: 36,
                                    child: CircularAvatarWidget(
                                      backgroundColor: Colors.blue[800]!,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        // Task title
                        Text(
                          app[i].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Drag to complete section
                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Stack(
                            children: [
                              // Drag handle
                              Positioned(
                                left: 4,
                                top: 4,
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: Color(0xFF4A90E2),
                                    size: 24,
                                  ),
                                ),
                              ),

                              // Edit button
                              Positioned(
                                right: 4,
                                top: 4,
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Color(0xFF4A90E2),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}