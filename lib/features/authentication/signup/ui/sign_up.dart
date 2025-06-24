import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/authentication/signup/ui/widget/sign_up_listener.dart';
import 'package:appointments/features/authentication/signup/ui/widget/text_fields_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: SafeArea(child: SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 30.h,horizontal: 9.h),
        child: Column(
          spacing: 10.h,
          children: [
             Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                const SizedBox(height: 20,),
            const Column(
              children: [
                SignUpForm(),
                SignUpListener()
              ],
            ),
          ],
        ),
      ),
    )),
    
    );
  }
}