// ignore_for_file: unnecessary_null_comparison, void_checks

import 'package:appointments/core/network/api_result.dart';
import 'package:appointments/features/calendar/data/api/api_calendar_services.dart';
import 'package:appointments/features/calendar/data/models/remote/appointments/response/appointment_response.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:flutter/widgets.dart';

class RemoteRepo {
  final ApiCalendarServices _apiCalendarServices;

  RemoteRepo(this._apiCalendarServices);

  Future<ApiResult<List<AppointmentEntitiy>>> getAppointmentById(
    String id,
  ) async {
    try {
      final readed = await _apiCalendarServices.getAppointmentsForUser(id);
     final  data =  readed ['data'] as List<dynamic>;
     final List<AppointmentResponseModel> appointments = data
          .map((e) => AppointmentResponseModel.fromJson(e as Map<String, dynamic>))
          .toList();
      if (appointments.isEmpty) {
        return const ApiResult.failure('No appointments found');
      }

       final List<AppointmentEntitiy> entities = appointments.map((e) => e.toEntity()).toList();

      return ApiResult.success(entities);
    } catch (e, stackTrace) {
      debugPrint('Error in getAppointmentById: $e');
      debugPrint('Stack trace: $stackTrace');
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<void>> createAppointment(AppointmentEntitiy apt) async {
    try {
      final model = apt.toModel();
      final create = await _apiCalendarServices.createAppointment(model);
      final result = create.toEntity();
      if (result != null) {
        return ApiResult.success(result);
      } else {
        return ApiResult.failure(
          'Failed to create appointment: $result is null',
        );
      }
    } catch (error) {
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<void>> updateAppointment(AppointmentEntitiy apt) async {
    try {
      final toModel = apt.toModel();
      final result = await _apiCalendarServices.updateAppointment(
        apt.mongoId!,
        toModel,
      );
      final toEntity = result.toEntity();

      return ApiResult.success(toEntity);
    } catch (error) {
      debugPrint('error from remote repo update ${error.toString()}');
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult<void>> deleteAppointment(String id) async {
    try {
      await _apiCalendarServices.deleteAppointment(id);

      return const ApiResult.success(null);
    } catch (e) {
      debugPrint('error from remote repo while deleteing ${e.toString()}');
      return ApiResult.failure(e.toString());
    }
  }
}
