// ignore_for_file: unnecessary_null_comparison

import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/rating_logic/cubit/rate_users_cubit.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/rating_logic/cubit/rate_users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendanceGridView extends StatelessWidget {
  const AttendanceGridView({super.key, required this.appointment});
  final AppointmentEntitiy appointment;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24.0.h,
        crossAxisSpacing: 16.0.w,
        childAspectRatio: 0.90,
      ),
      itemCount: appointment.acceptedBy?.length ?? 0,
      itemBuilder: (context, index) {
        final userId = appointment.rating![0].ratedUsers[index].ratedUser;
        final user = appointment.acceptedBy![index];
        if (user == null) return const SizedBox.shrink();

        return Column(
          children: [
            GestureDetector(
              onTap:
                  () => Navigator.pushNamed(
                    context,
                    StringRoutes.rateUser,
                    arguments: {
                      'index': index,
                      'appointment': appointment,
                      'cubit': BlocProvider.of<RateUsersCubit>(context),
                    },
                  ),
              child: CircleAvatar(
                radius: 70,
                child:
                    user.imageUrl != null
                        ? Image.network(
                          user.imageUrl,
                          fit: BoxFit.cover,
                          width: 170.h,
                          height: 140.h,
                        )
                        : Image.asset(
                          'assets/images/person.png',
                          fit: BoxFit.cover,
                          width: 170.h,
                          height: 140.h,
                        ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              user.name,
              style: TextStyles.font16BlackMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4.0),
            BlocBuilder<RateUsersCubit, RateUsersState>(
              buildWhen: (previous, current) => previous.users != current.users,
              builder: (context, state) {
                if (userId == null)
                  return Text('0', style: TextStyles.font14GrayRegular);

                final userRatings = state.users.keys.contains(userId);

                if (!userRatings) {
                  return Text('0 null', style: TextStyles.font14GrayRegular);
                } else {
                  return Text(
                    '${state.users[userId]!.map((e) => e.cumulativeRatingPoints).last}',
                    style: TextStyles.font14GrayRegular,
                    textAlign: TextAlign.center,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
