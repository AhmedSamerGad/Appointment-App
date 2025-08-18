// ignore_for_file: avoid_print

import 'package:appointments/core/routing/app_router.dart';
import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/utils/check_token_validation.dart';
import 'package:appointments/core/utils/dependancy_injections.dart';
import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/network/api_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  isLoggedInUser = await validateStoredToken();
  print(
    'App start auth check. Token exists: , ${isLoggedInUser ? 'Yes' : 'No}'}',
  );

  setUpGetIt();

  runApp(MyApp(appRouters: AppRouters(), isLoggedInUser: isLoggedInUser));
}

class MyApp extends StatelessWidget {
  final AppRouters appRouters;
  final bool isLoggedInUser;

  const MyApp({
    super.key,
    required this.appRouters,
    required this.isLoggedInUser,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),

      minTextAdapt: true,
      child: BlocProvider(
        create:(context) =>CalendarCubit(),
        child: MaterialApp(
          title: 'Appointments App',
          debugShowCheckedModeBanner: false,

          initialRoute:
            isLoggedInUser ? StringRoutes.group : StringRoutes.login,
          onGenerateRoute: appRouters.generateRoute,
        ),
      ),
    );
  }
}
