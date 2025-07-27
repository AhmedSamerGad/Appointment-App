import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_buttons.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/rating_logic/cubit/rate_users_cubit.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/rating_logic/cubit/rate_users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveConfigration extends StatelessWidget {
  const SaveConfigration({super.key, required this.appointment, required this.cubit});
  final AppointmentEntitiy appointment;
  final RemotCalendarCubit cubit;
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RateUsersCubit, RateUsersState>(
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      if (state.users.isNotEmpty) {
                        if (appointment.acceptedBy!.length !=
                            state.users.keys.length) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'Waring',
                                  style: TextStyles.font14DarkBlueBold,
                                ),
                                icon: const Icon(
                                  Icons.warning_amber_outlined,
                                  color: Colors.redAccent,
                                ),
                                content: Text(
                                  'Are you sure not all user rated',
                                  style: TextStyles.font12DarkBlueRegular,
                                ),
                                actions: [
                                
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Cancle',
                                          style: TextStyles.font12BlueRegular
                                              .copyWith(
                                                color: Colors.redAccent,
                                              ),
                                        ),
                                      ),
                                      AppTextButton(
                                        buttonHeight: 40.h,
                                        buttonWidth: 100.w,
                                        verticalPadding: 12.h,
                                        buttonText: 'Save',
                                        textStyle: TextStyles.font16WhiteMedium.copyWith(
                                          color: Colors.white,
                                          fontSize: 12.sp
                                        ),
                                        onPressed: () {
                                          final ratedData = ReviewEntity(
                                            ratedUsers:
                                                state.users.values
                                                    .expand((list) => list)
                                                    .toList(),
                                          );

                                          cubit.startRate(ratedData, appointment.mongoId!);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          final ratedData = ReviewEntity(
                            ratedUsers:
                                state.users.values
                                    .expand((list) => list)
                                    .toList(),
                          );
                          cubit.startRate(ratedData , appointment.mongoId!);
                        }
                      }
                    },
                    child: Text('Save', style: TextStyles.font13DarkBlueMedium),
                  );
                },
              );
  }
}