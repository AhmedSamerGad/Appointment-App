import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:appointments/features/calendar/domin/review_entity.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/logic/cubit/add_appointment_logic_cubit.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/logic/cubit/add_appointment_logic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final TextEditingController _controller = TextEditingController();
  double sliderValue = 0; // ✨ نحطها هنا بدل داخل build

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAppointmentLogicCubit, AddAppointmentLogicState>(
      builder: (context, state) {
        final cubit = context.read<AddAppointmentLogicCubit>();

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Reviews', style: TextStyles.font18DarkBlueBold),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: const Text('Review Item'),
                              content: StatefulBuilder(
                                builder: (context, setState) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppTextFormField(
                                        controller: _controller,
                                        validator: (String? value) {
                                          if (value == null || value.trim().isEmpty) {
                                            return 'Title is required';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(height: 15.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Text('Points', style: TextStyles.font14DarkBlueBold),
                                          ),
                                          Text(sliderValue.toInt().toString(), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            flex: 7,
                                            child: SliderTheme(
                                              data: SliderTheme.of(context).copyWith(
                                                trackHeight: 5,
                                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
                                                overlayShape: SliderComponentShape.noOverlay,
                                                activeTrackColor: Colors.black,
                                                inactiveTrackColor: const Color(0xFFE5E8EC),
                                              ),
                                              child: Slider(
                                                value: sliderValue,
                                                min: 0,
                                                max: 100,
                                                divisions: 10,
                                                onChanged: (value) {
                                                  setState(() {
                                                    sliderValue = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final title = _controller.text.trim();
                                    if (title.isEmpty) return;
              
                                    cubit.addReviw(ReviewingEvtity(
                                      title: title,
                                      points: sliderValue.toInt(),
                                    ));
                                    _controller.clear();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Submit'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.new_label),
                    ),
                  ),
                  ...state.reviews.map(
                    (review) => Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: ColorsManager.ofWhite,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: ColorsManager.gray, width: 1.0),
                      ),
                      child: ListTile(
                        horizontalTitleGap: 12.h,
                        leading: const CircleAvatar(
                          backgroundColor: ColorsManager.lightGray,
                          child: Icon(Icons.star_outlined, color: Colors.amber),
                        ),
                        title: Row(
                          children: [
                            Text(
                              review.title,
                              style: TextStyles.font16DisplayBold.copyWith(color: ColorsManager.darkBlue),
                            ),
                            SizedBox(width: 30.w,) ,
                            Text(
                              review.points.toString(),
                              style: TextStyles.font16DisplayBold.copyWith(color: ColorsManager.mainBlue),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            cubit.removeReview(review);
                          },
                          icon: const Icon(Icons.cancel_rounded),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
            ],
          ),
        );
      },
    );
  }
}
