import 'package:appointments/core/network/api_result.dart';
import 'package:appointments/features/calendar/data/models/local/local_model.dart';
import 'package:appointments/features/calendar/data/sources/local/local_data_source.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:flutter/material.dart';

class CalendarRepo {
  final LocalDataSource _localDataSource;
  //  RemoteSource? _remoteSource;

  CalendarRepo(this._localDataSource);

  Future<ApiResult<List<AppointmentEntitiy>>> getAppointmentsForMonth(DateTime month) async {
    try {
      final model = await _localDataSource.getAllAppointmentsForMonth(month);
      final entity = model.map((e) => e.toEntity()).toList();
      return ApiResult.success(entity);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  Future<ApiResult<List<AppointmentEntitiy>>> getAppointmentsForDay(DateTime day)async{
    try{
      final model= await _localDataSource.fetchAppointmentsForDay(day);
      final entity = model.map((e)=>e.toEntity()).toList();
      return ApiResult.success(entity);
    }catch(e){
    return  ApiResult.failure(e.toString());

    }
  }

  Future<ApiResult<void>> createAppointment (AppointmentEntitiy apt)async{
  try  {
     debugPrint('Creating appointment: ${apt.title}');
    debugPrint('Date: ${apt.startingDate}');
    
    final model = LocalAppointmentModel.fromEntity(apt);
    await _localDataSource.createAppointment(model);
  return  const ApiResult.success(null);
    } catch(e){
      return ApiResult.failure(e.toString());
    }
  }

 Future<ApiResult<void>> updateAppointment(AppointmentEntitiy appointment) async {
  // Debug print
  try { 
    final model = LocalAppointmentModel.fromEntity(appointment);
    // Debug print
    await _localDataSource.updateAppointment(model);
    // Debug print
    return const ApiResult.success(null);
  } catch(e) {
    // Debug print
    return ApiResult.failure(e.toString());
  }
}

  Future <ApiResult<void>> deleteAppointment(int id )async{
    try{
      await _localDataSource.deleteAppointment(id);
      
      return const ApiResult.success(null);
    }catch(e){
      return ApiResult.failure(e.toString());
    }
  }

Future<ApiResult<String>> isStartingTimeValid(
  DateTime day,
  TimeOfDay proposedStartTime,
  TimeOfDay? proposedEndTime, // nullable now
) async {
  try {
    final result = await getAppointmentsForDay(day);

    return result.when(
      success: (appointments) {
        final now = DateTime.now();
        final isToday = now.year == day.year &&
            now.month == day.month &&
            now.day == day.day;

        final proposedStart = DateTime(
          day.year,
          day.month,
          day.day,
          proposedStartTime.hour,
          proposedStartTime.minute,
        );

        // If end time is null, treat it as a point-in-time appointment
        final proposedEnd = proposedEndTime != null
            ? DateTime(day.year, day.month, day.day, proposedEndTime.hour,
                proposedEndTime.minute)
            : proposedStart.add(const Duration(minutes: 1)); // assume 1-min default slot

        if (proposedEnd.isBefore(proposedStart) ||
            proposedEnd.isAtSameMomentAs(proposedStart)) {
          return const ApiResult.failure('Ending time must be after starting time');
        }

        if (isToday && proposedStart.isBefore(now)) {
          return const ApiResult.failure('Starting time is in the past');
        }

        for (final appointment in appointments) {
          final existingStart = DateTime(
            day.year,
            day.month,
            day.day,
            appointment.startingTime.hour,
            appointment.startingTime.minute,
          );

          final existingEnd = appointment.endingTime != null
              ? DateTime(
                  day.year,
                  day.month,
                  day.day,
                  appointment.endingTime!.hour,
                  appointment.endingTime!.minute,
                )
              : existingStart.add(const Duration(minutes: 1)); // default duration

          final overlaps = proposedStart.isBefore(existingEnd) &&
              proposedEnd.isAfter(existingStart);

          if (overlaps) {
            return const ApiResult.failure(
              'Time overlaps with another appointment',
            );
          }
        }

        return const ApiResult.success('Starting time is valid');
      },
      failure: (error) {
        return ApiResult.failure(error.toString());
      },
    );
  } catch (e) {
    return ApiResult.failure(e.toString());
  }
}

}