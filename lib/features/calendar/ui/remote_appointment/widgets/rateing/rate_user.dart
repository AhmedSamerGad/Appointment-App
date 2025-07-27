// ignore_for_file: unnecessary_null_comparison
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/rating_logic/cubit/rate_users_cubit.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/rating_logic/cubit/rate_users_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateUser extends StatefulWidget {
  const RateUser({super.key, required this.index, required this.appointment});
  final int index;
  final AppointmentEntitiy appointment;
  @override
  State<RateUser> createState() => _RateUserState();
}

class _RateUserState extends State<RateUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              BlocBuilder<RateUsersCubit, RateUsersState>(
                builder: (BuildContext context, state) {
                  return TextButton(
                    onPressed: () {
                      print('index is ${widget.index}');
                      print(state.ratings.map((e) => e.currentValue));
                      final totalPoints = state.ratings.fold<int>(
                        0,
                        (sum, r) => sum + (r.currentValue ?? 0),
                      );
                      final cubit = context.read<RateUsersCubit>();
                      print('total point $totalPoints');
                      final Rate = RatedUserEntity(
                        reviews: state.ratings,
                        cumulativeRatingPoints: totalPoints,
                        ratedUser:
                            widget
                                .appointment
                                .rating![0]
                                .ratedUsers[widget.index]
                                .ratedUser,
                                comment: cubit.commentControllar.text
                      );
                      
                      cubit.setRateUser(
                        widget
                            .appointment
                            .rating![0]
                            .ratedUsers[widget.index]
                            .ratedUser!,
                            Rate
                      );

                      Navigator.pop(context );
                    },
                    child: Text('Save', style: TextStyles.font14DarkBlueMedium),
                  );
                },
              ),
            ],
            centerTitle: true,
            title: Text('Rate User', style: TextStyles.font18BlackDisplayBold),
          ),
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: true,
            backgroundColor: Colors.white,
            elevation: 0,
            expandedHeight: 180.h,
            leading: const SizedBox.expand(),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  CircleAvatar(
                    radius: 48,
                    backgroundImage:
                        widget.appointment.acceptedBy![widget.index].imageUrl !=
                                null
                            ? NetworkImage(
                              widget
                                  .appointment
                                  .acceptedBy![widget.index]
                                  .imageUrl,
                            )
                            : const AssetImage('assets/images/person.png'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.appointment.acceptedBy![widget.index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    ' Admin',
                    style: TextStyle(color: Color(0xFF8A99A7), fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Attendance',
                      style: TextStyles.font18DarkBlueBold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<RateUsersCubit, RateUsersState>(
                    builder: (context, state) {
                      final cubit = context.read<RateUsersCubit>();

                      final appointmentReviews =
                          widget
                              .appointment
                              .rating?[0]
                              .ratedUsers[widget.index]
                              .reviews ??
                          [];

                      // Inject the appointment reviews into the Cubit only once
                      if (state.ratings.isEmpty &&
                          appointmentReviews.isNotEmpty) {
                        // This will emit and trigger a rebuild with the values
                        Future.microtask(
                          () => cubit.setInitialRatings(appointmentReviews),
                        );
                        return const Center(child: CircularProgressIndicator());
                      }

                      return Column(
                        children:
                            state.ratings.map((rating) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: RatingUser(
                                  label: rating.title,
                                  maxValue: rating.points.toDouble(),
                                  value: rating.currentValue!.toDouble(),
                                  onChanged: (value) {
                                    cubit.updateSlider(rating.title, value);
                                  },
                                ),
                              );
                            }).toList(),
                      );
                    },
                  ),

                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      spacing: 5.w,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            'Comment',
                            style: TextStyles.font14DarkBlueBold,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: AppTextFormField(
                            validator: (value) {},
                            controller:
                                context
                                    .read<RateUsersCubit>()
                                    .commentControllar,
                            label: Text(
                              'Comment',
                              style: TextStyles.font12GrayRegular,
                            ),
                            contentPadding: const EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
