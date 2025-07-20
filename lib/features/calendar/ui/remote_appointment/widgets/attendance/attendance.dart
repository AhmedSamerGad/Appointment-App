// ignore_for_file: unnecessary_null_comparison

import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Attendance extends StatelessWidget {
  const Attendance({
    super.key,
    required this.appointment,
    required this.reviewList,
  });
  final AppointmentEntitiy appointment;
  final RatedUserEntity reviewList;

  double calculatePointsPercentage(int userIndex) {
    final ratedUser = appointment.rating![0].ratedUsers[userIndex];
    final totalPoints = ratedUser.reviews.fold<int>(0, (sum, review) => sum + review.points);
    final currentPoints = reviewList.cumulativeRatingPoints;
    if(currentPoints! <= 0 || totalPoints <=0) return 0;
    return ((currentPoints / totalPoints) * 100) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance', style: TextStyles.font18BlackDisplayBold),
        actionsPadding: const EdgeInsets.all(16.0),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: buildGridView(),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 0.85,
      ),
      itemCount: appointment.acceptedBy!.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap:
                  () => Navigator.pushNamed(
                    context,
                    StringRoutes.rateUser,
                    arguments: [index, appointment],
                  ),
              child: CircleAvatar(
                radius: 70,
                child: Image(
                  image:
                      appointment.acceptedBy![index].imageUrl != null
                          ? NetworkImage(
                            appointment.acceptedBy![index].imageUrl,
                          )
                          : const AssetImage('assets/images/person.png'),
                  fit: BoxFit.cover,
                  width: 170.h,
                  height: 140.h,
                  color: Colors.transparent,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              appointment.acceptedBy![index].name,
              style: TextStyles.font16BlackMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4.0),
            Text(
              // i want to update this in frontend or backend
              calculatePointsPercentage(index)
                  .toString(),
              style: TextStyles.font14GrayRegular,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
