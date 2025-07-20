
import 'package:appointments/core/network/api_constant.dart';
import 'package:appointments/features/calendar/data/api/api_calendar_constant.dart';
import 'package:appointments/features/calendar/data/models/remote/appointments/request/appointment_request_body.dart';
import 'package:appointments/features/calendar/data/models/remote/appointments/response/appointment_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_calendar_services.g.dart';
@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiCalendarServices {
  factory ApiCalendarServices(Dio dio) = _ApiCalendarServices;

  @POST(ApiCalendarConstant.createAppointment)
  Future<AppointmentResponseModel> createAppointment(
    @Body() AppointmentRequestBody appointmentRequest,
  );

  @GET(ApiCalendarConstant.getAppointment)
  Future<Map<String , dynamic>> getAppointmentsForUser(
    @Path('id') String userId,
  );

  @PUT(ApiCalendarConstant.updateAppointment)
  Future<AppointmentResponseModel> updateAppointment(
    @Path('id') String appointmentId,
    @Body() AppointmentRequestBody appointmentRequest,
  );

  @DELETE(ApiCalendarConstant.deleteAppointment)
  Future<void> deleteAppointment(
    @Path('id') String appointmentId,
  );
}
