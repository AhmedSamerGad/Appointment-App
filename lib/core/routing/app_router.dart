// ignore_for_file: strict_raw_type

import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/utils/dependancy_injections.dart';
import 'package:appointments/features/authentication/login/logic/login_cubit.dart';
import 'package:appointments/features/authentication/signup/logic/cubit/sign_up_cubit.dart';
import 'package:appointments/features/authentication/signup/ui/sign_up.dart';
import 'package:appointments/features/calendar/data/repo/remote_repo.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:appointments/features/calendar/ui/local_appointment/add_appointment/local_add_appointment.dart';
import 'package:appointments/features/calendar/ui/calendar.dart';
import 'package:appointments/features/calendar/ui/local_appointment/update_appointments/update_appointment.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/logic/cubit/add_appointment_logic_cubit.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/add_appointment/widgets/add_remote_appointment.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/attendance/attendance.dart';
import 'package:appointments/features/calendar/ui/remote_appointment/widgets/rateing/rate_user.dart';
import 'package:appointments/features/groups/data/repo/group_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/login/ui/login.dart';

class AppRouters {
  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case StringRoutes.login:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (BuildContext context) => LoginCubit(getIt()),
                child: const LoginScreen(),
              ),
        );
      case StringRoutes.calender:
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => CalendarCubit()),
                  BlocProvider(
                    create: (context) => LocalCalendarCubit(localGetIt()),
                  ),
                  BlocProvider(
                    create: (context) => RemotCalendarCubit(getIt<RemoteRepo>() , getIt<GroupRepo>()),
                  ),
                ],
                child: const Calendar(),
              ),
        );
      case StringRoutes.signUp:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => SignUpCubit(getIt()),
                child: const SignUp(),
              ),
        );
      case StringRoutes.addLocalAppointment:
        return MaterialPageRoute(
          builder: (_) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => LocalCalendarCubit(localGetIt()),
                ),
                BlocProvider(create: (context) => CalendarCubit()),
              ],
              child: const LocalAddAppointment(),
            );
          },
        );
      case StringRoutes.updateLocalAppointment:
        return MaterialPageRoute(
          builder: (_) {
            final args = setting.arguments;
            return MultiBlocProvider(
              providers: [
                BlocProvider<LocalCalendarCubit>.value(
                  value: localGetIt<LocalCalendarCubit>(),
                ),
                BlocProvider(create: (context) => CalendarCubit()),
              ],
              child: UpdateAppointment(
                appointmentId: args as AppointmentEntitiy,
              ),
            );
          },
        );
      case StringRoutes.addRemoteAppointment:
        return MaterialPageRoute(
          builder: (_) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => RemotCalendarCubit(getIt<RemoteRepo>() , getIt<GroupRepo>())),
                BlocProvider(create: (context) => AddAppointmentLogicCubit()),
              ],
              child: const AddRemoteAppointment(),
            );
          },
        );

      case StringRoutes.attendance:
        return MaterialPageRoute(
          builder: (_) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => RemotCalendarCubit(getIt<RemoteRepo>() , getIt<GroupRepo>())),
                BlocProvider(create: (context) => AddAppointmentLogicCubit()),
              ],
              child: const Attendance(),
            );
          },
        );
      case StringRoutes.rateUser:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (context) => AddAppointmentLogicCubit(),
              child: const RateUser(),
            );
          },
        );
    }

    return null;
  }
}
