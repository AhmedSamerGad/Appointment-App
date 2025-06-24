import 'package:appointments/core/database/database_helper.dart';
import 'package:appointments/core/network/dio_halper.dart';
import 'package:appointments/features/authentication/api/api_services.dart';
import 'package:appointments/features/authentication/login/data/repo/login_repo.dart';
import 'package:appointments/features/authentication/login/logic/login_cubit.dart';
import 'package:appointments/features/authentication/signup/data/repo/sign_up_repo.dart';
import 'package:appointments/features/authentication/signup/logic/cubit/sign_up_cubit.dart';
import 'package:appointments/features/calendar/data/api/api_calendar_services.dart';
import 'package:appointments/features/calendar/data/repo/calendar_repo.dart';
import 'package:appointments/features/calendar/data/repo/remote_repo.dart';
import 'package:appointments/features/calendar/data/sources/local/local_data_source.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:appointments/features/groups/data/api/group_api_service.dart';
import 'package:appointments/features/groups/data/repo/group_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
final localGetIt = GetIt.instance;


void setUpGetIt() async {
  getIt.registerLazySingleton<Dio>(() => DioHelper.getDio());
  localGetIt.registerLazySingleton<DatabaseHelper>(()=>DatabaseHelper.instance);

  getIt.registerLazySingleton<LoginApiServices>(
    () => LoginApiServices(getIt()),
  );
  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignUpRepo>(()=>SignUpRepo(getIt()));
  getIt.registerLazySingleton<SignUpCubit>(()=>SignUpCubit(getIt()));
  // calendar 

  getIt.registerLazySingleton<ApiCalendarServices>(()=>ApiCalendarServices(getIt()));
  getIt.registerLazySingleton<RemoteRepo>(()=> RemoteRepo(getIt()));
  getIt.registerLazySingleton<RemotCalendarCubit>(()=> RemotCalendarCubit(getIt<RemoteRepo>() , getIt<GroupRepo>()));

 // groups
 getIt.registerLazySingleton<GroupApiService>(()=>GroupApiService(getIt()));
  getIt.registerLazySingleton<GroupRepo>(()=>GroupRepo(getIt()));


  // local Calendar 

  localGetIt.registerLazySingleton<LocalDataSource>(()=>LocalDataSource(localGetIt<DatabaseHelper>()));
  localGetIt.registerLazySingleton<CalendarRepo>(()=>CalendarRepo(localGetIt()));
  localGetIt.registerLazySingleton<LocalCalendarCubit>(()=>LocalCalendarCubit(localGetIt()));
}
