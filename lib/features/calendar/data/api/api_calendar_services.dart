import 'package:appointments/core/network/api_constant.dart';
import 'package:appointments/features/calendar/data/api/api_calendar_constant.dart';
import 'package:appointments/features/calendar/data/models/appointment_model.dart';
import 'package:appointments/features/calendar/data/models/remote/appointment_responce.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_calendar_services.g.dart';
@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiCalendarServices {
  factory ApiCalendarServices(Dio dio) {
    return _ApiCalendarServices(dio);
  }

  @POST(ApiCalendarConstant.createAppointment)
  Future<AppointmentResponce> createAppointment(@Body() AppointmentModel appointmentModel);

  @GET(ApiCalendarConstant.getAppointment)
  Future<AppointmentResponce> getAppointmentsForUser(@Path('id') String id);

  @PUT(ApiCalendarConstant.updateAppointment)
  Future<AppointmentResponce> updateAppointment(@Path('id') String id, @Body() AppointmentModel appointmentModel);

  @DELETE(ApiCalendarConstant.deleteAppointment)
  Future<void> deleteAppointment(@Path('id') String id);
}