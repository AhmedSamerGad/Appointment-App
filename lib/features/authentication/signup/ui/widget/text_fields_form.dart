// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/core/utils/app_regx.dart';
import 'package:appointments/core/widgets/app_buttons.dart';
import 'package:appointments/core/widgets/app_textform.dart';
import 'package:appointments/features/authentication/login/ui/widgets/password_validator.dart';
import 'package:appointments/features/authentication/signup/data/models/sign_up_request.dart';
import 'package:appointments/features/authentication/signup/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});
  
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordObscureText = true;
  String groupValue = 'male'; // Define the groupValue variable

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    setUpPasswordControllerListener();
  }
    void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
    key: formKey,
    child: Container(
      // height: 330.h,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 1,
        offset: const Offset(0, 1),
        ),
      ],
      ),
        
      child: Stack(
      clipBehavior: Clip.none,
        children: [
          Column(
            spacing: 18,
            children: [
              SizedBox(height: 20.h,),
              AppTextFormField(controller: nameController,
              hintText: 'name', validator: (value){
                  if (value!.isEmpty || value  == null) {
                    return 'Please provide a valid name';
                  }
                  return null;
                }),
                AppTextFormField(
                  controller: emailController,
                  hintText: 'email',
                  validator: (value) {
                    bool isEmailValid = AppRegex.isEmailValid(value!);
                    if (value.isEmpty || !isEmailValid || value ==null) {
                      return 'Please provide a valid email';
                    }
                    return null;
                  },
                ),
                AppTextFormField(
                  controller: passwordController,
                  maxLines: 1,
                  hintText: 'password',
                  validator: (value) {
                    if (value!.isEmpty || value ==null) {
                      return 'Please provide a valid password';
                    }
                    return null;
                  },
                  isObscureText: isPasswordObscureText,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordObscureText = !isPasswordObscureText;
                      });
                    },
                    child: Icon(
                      isPasswordObscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                PasswordValidation(
                  isLowerCase: hasLowercase,
                  isUpperCase: hasUppercase,
                  hasSpacialChar: hasSpecialCharacters,
                  hasDigit: hasNumber,
                  hasMinLength: hasMinLength,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<String>(
                      value: 'male',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      },
                    ),
                    Text('Male', style: TextStyles.font14DarkBlueMedium),
                    SizedBox(width: 20.w),
                    Radio<String>(
                      value: 'female',
                      groupValue: groupValue,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value!;
                        });
                      },
                    ),
                    Text('Female', style: TextStyles.font14DarkBlueMedium),
                  ],
                ),
                AppTextButton(
                  buttonText: 'Create',
                  textStyle: TextStyles.font16WhiteMedium,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      String selectedGender = groupValue;
                      context.read<SignUpCubit>().emitingSignUp(
                        SignUpRequest(
                          email: emailController.text.trim(),
                          password: passwordController.text,
                          gender: selectedGender,
                          name: nameController.text,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            Positioned(
              top: -50.h,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorsManager.lightBlue,
                      radius: 40,
                      child: IconButton(
                        onPressed: () {
                          // i want to make on click to open camera or gallery
                        },
                        icon: Icon(
                          Icons.person_3_outlined,
                          size: 38.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
    }
    @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }
  }
  

