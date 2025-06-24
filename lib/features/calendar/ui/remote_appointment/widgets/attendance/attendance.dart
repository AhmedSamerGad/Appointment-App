import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Attendance',style: TextStyles.font18BlackDisplayBold,),
        actionsPadding:const EdgeInsets.all(16.0),
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
      padding:  EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24.0,
        crossAxisSpacing: 16.0,
        childAspectRatio: 0.85,
      ),
      itemCount: 5, // Example item count
      itemBuilder: (context, index) {
        return Column(children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, StringRoutes.rateUser),
            child: CircleAvatar(
              radius: 70,
              child:  Image.asset('assets/images/person.png', fit: BoxFit.cover, width: 170.h, height: 140.h, color: Colors.transparent, colorBlendMode: BlendMode.darken, ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Ethan Carter',
            style: TextStyles.font16BlackMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4.0),
          Text(
            '90 %',
            style: TextStyles.font14GrayRegular,
            textAlign: TextAlign.center,
          ),
        ],);
      
      },
    );
  }
}