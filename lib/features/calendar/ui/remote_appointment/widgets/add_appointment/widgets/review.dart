import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/widgets/app_buttons.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final List<String> reviews = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Reviews', style: TextStyles.font18DarkBlueBold),
        SizedBox(height: 8.h),
        Row(
          spacing: 5.h,
          children: [
            Expanded(
              flex: 2,
              child: AppTextFormField(
                controller: _controller,
                validator: (value) {},
                hintText: 'Add new review',
                backgroundColor: ColorsManager.ofWhite,
                hintStyle: TextStyles.font16Medium,
                onTap: () {},
                contentPadding:const EdgeInsets.all(16.0),
              ),
            ),
            Expanded(
              flex: 1,
              child: AppTextButton(
                buttonText: 'Submit',
                textStyle: TextStyles.font16WhiteMedium,
                onPressed: () {
                  if (_controller.text.trim().isNotEmpty) {
                    setState(() {
                      reviews.add(_controller.text.trim());
                      _controller.clear();
                    });
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: reviews
              .map((review) => Container(
                decoration: BoxDecoration(
                  color: ColorsManager.ofWhite,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: ColorsManager.gray, width: 1.0),
                ),
                child: ListTile(
                  horizontalTitleGap: 12.h,
                  leading: const CircleAvatar(backgroundColor: ColorsManager.lightGray,child: Icon(Icons.star_border, color: ColorsManager.darkBlue )),
                  title: Card(
                        // color: Colors.white,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(12.0),
                        //   side: const BorderSide(color: ColorsManager.darkBlue, width: 1.0),
                        // ),
                        elevation: 0,
                        child: Text(
                          review,
                          style: TextStyles.font16BlackMedium,
                        ),
                      ),
                ),
              ))
              .toList(),
        ),
      ],
    );
  }
}