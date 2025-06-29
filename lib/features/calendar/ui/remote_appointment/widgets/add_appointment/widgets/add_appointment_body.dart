// ignore_for_file: void_checks, must_be_immutable

import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_buttons.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:appointments/core/widgets/constant.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_state.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/widgets/add_forms.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/widgets/attendees_list.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/widgets/review.dart';
import 'package:appointments/features/calendar/ui/widgets/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAppointmentBody extends StatefulWidget {
  const AddAppointmentBody({super.key});

  @override
  State<AddAppointmentBody> createState() => _AddAppointmentBodyState();
}

class _AddAppointmentBodyState extends State<AddAppointmentBody> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController startingTimeController = TextEditingController();

  final TextEditingController endingTimeController = TextEditingController();
  List<String> attendance = [];
@override
  void initState() {
    super.initState();
     context.read<RemotCalendarCubit>().getGroupForAdmin();

  }
  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
      child: Column(
        spacing: 12.h,
        children: [
          const AddForms(
           
          ),
          Column(
            spacing: 8.h,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Attendees', style: TextStyles.font18DarkBlueBold),
                  SizedBox(height: 8.h),

                  BlocBuilder<RemotCalendarCubit, RemotCalendarState>(
                
                    builder: (context, state) {
                      return state.maybeWhen(
                        remoteSuccess: (value) {
                          return GroupCardsList(groups: value );
                        },
                         orElse: (){
                          return const CircularProgressIndicator();
                         }
                       ) ;
                      
                    },
                  ),
                ],
              ),

              AppTextFormField(
                validator: (value) {},
                label: Text(
                  'Location',
                  style: TextStyles.font13DarkBlueRegular,
                ),
                hintText: 'Add Location',
                backgroundColor: ColorsManager.ofWhite,
                hintStyle: TextStyles.font16Medium,
                suffixIcon: const Icon(
                  Icons.location_on,
                  color: ColorsManager.ofBlack,
                ),
                onTap: () {},
                contentPadding: const EdgeInsets.all(16.0),
              ),
              SizedBox(
                height: 100.h,
                child: AppTextFormField(
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  validator: (value) {},
                  label: Text(
                    'Note',
                    style: TextStyles.font13DarkBlueRegular,
                  ),
                  hintText: 'Add Note',
                  backgroundColor: ColorsManager.ofWhite,
                  hintStyle: TextStyles.font16Medium,
                  onTap: () {},
                  contentPadding:  EdgeInsets.symmetric(vertical: 3.h , horizontal: 12.w),
                ),
              ),
              const Review(),
              AppTextButton(
                buttonText: 'Crate',
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<RemotCalendarCubit>().createAppointment(
                      AppointmentEntitiy(
                        title: titleController.text,
                        startingDate: CalendarView.selectedDate!,
                        startingTime:
                            startingTimeController.text.isNotEmpty
                                ? TimeOfDay(
                                  hour: int.parse(
                                    startingTimeController.text.split(':')[0],
                                  ),
                                  minute: int.parse(
                                    startingTimeController.text.split(':')[1],
                                  ),
                                )
                                : TimeOfDay.now(),
                        endingTime:
                            endingTimeController.text.isNotEmpty
                                ? TimeOfDay(
                                  hour: int.parse(
                                    endingTimeController.text.split(':')[0],
                                  ),
                                  minute: int.parse(
                                    endingTimeController.text.split(':')[1],
                                  ),
                                )
                                : null,

                        // Replace with actual user ID
                        attendance: [],
                      ),
                    );
                  }
                  BlocListener<RemotCalendarCubit, RemotCalendarState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        remoteLoading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        remoteSuccess: (_) {
                          Navigator.popAndPushNamed(
                            context,
                            StringRoutes.calender,
                          );
                          return const SizedBox.expand();
                        },
                        remoteError: (error) => setupErrorState(context, error),
                        orElse: () {
                          return const SizedBox.expand();
                        },
                      );
                    },
                  );
                },
                backgroundColor: ColorsManager.mainBlue,
                buttonWidth: 200.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
