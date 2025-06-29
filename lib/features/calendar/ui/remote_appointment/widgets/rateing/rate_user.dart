import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/logic/cubit/add_appointment_logic_cubit.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/logic/cubit/add_appointment_logic_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateUser extends StatefulWidget {
  const RateUser({super.key});

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
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/images/person.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Ethan Carter',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(height: 4),
                  Text(
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
                  BlocBuilder<AddAppointmentLogicCubit, AddAppointmentLogicState>(
                    builder: (context, state) {
                      final cubit = context.read<AddAppointmentLogicCubit>();
                      return Column(
                        children:
                            cubit.currentRatings.map((rating) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: RatingUser(
                                  label: rating.label,
                                  value: rating.value,
                                  onChanged: (value) {
                                    cubit.updateSlider(rating.label, value);
                                  },
                                ),
                              );
                            }).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
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
