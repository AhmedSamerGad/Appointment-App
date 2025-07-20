import 'package:appointments/core/utils/shared_prefrances.dart';
import 'package:appointments/features/calendar/data/repo/remote_repo.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_state.dart';
import 'package:appointments/features/groups/data/model/group_model.dart';
import 'package:appointments/features/groups/data/repo/group_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemotCalendarCubit extends Cubit<RemotCalendarState> {
  RemotCalendarCubit(this._remoteRepo, this._groupRepo)
    : super(const RemotCalendarState.remoteLoading());
  final RemoteRepo _remoteRepo;
  final GroupRepo _groupRepo;

  Map<DateTime, List<AppointmentEntitiy>> appointments = {};

Future<void> getAppointmentsForCurrentUser() async {
  emit(const RemotCalendarState.remoteLoading());
  try {
    final response = await _remoteRepo.getAppointmentById(await SharedPrefrancesHelpers.getSecuredString('userId'));
    
    response.when(
      success: (retrievedAppointments) {
        // 1. Clear existing data
        appointments.clear();
        
        // 2. Group appointments by date
        for (final appointment in retrievedAppointments) {
          try {
            // Normalize the date (remove time component)
            final dateKey = DateTime(
              appointment.startingDate.year,
              appointment.startingDate.month,
              appointment.startingDate.day,
            );
            
            // 3. Add to map safely
            if (appointments.containsKey(dateKey)) {
              appointments[dateKey]!.add(appointment);
            } else {
              appointments[dateKey] = [appointment];
            }
          } catch (e) {
            debugPrint('Error processing appointment ${appointment.appointmentId}: $e');
          }
        }
        
        // 4. Debug output
        debugPrint('Successfully loaded appointments for ${appointments.length} dates');
        if (appointments.isNotEmpty) {
          final sampleDate = appointments.keys.first;
          debugPrint('Example: $sampleDate has ${appointments[sampleDate]!.length} appointments');
        }
        
        // 5. Emit success state
        emit(RemotCalendarState.remoteSuccess(Map.from(appointments)));
      },
      failure: (error) {
        debugPrint('Failed to load appointments: $error');
        emit(RemotCalendarState.remoteError(error));
      },
    );
  } catch (error, stackTrace) {
    debugPrint('Unexpected error: $error\n$stackTrace');
    emit(const RemotCalendarState.remoteError('An unexpected error occurred'));
  }
}

  // Add this new method
  List<AppointmentEntitiy> loadAppointmentsForDay(DateTime day) {
   try{ final normalizedDay = DateTime(day.year, day.month, day.day);
    if(appointments.containsKey(normalizedDay)) {
      debugPrint('Appointments for $normalizedDay: ${appointments[normalizedDay]!.length}');
      emit(RemotCalendarState.remoteDayChange(appointments[normalizedDay]! , normalizedDay));
      return appointments[normalizedDay]!;

    } else {
      debugPrint('No appointments found for $normalizedDay');
      emit(RemotCalendarState.remoteDayChange([], normalizedDay));
      return [];
    }}catch (e) {
      debugPrint('Error loading appointments for $day: $e');
      emit(RemotCalendarState.remoteError(e.toString()));
      return [];
    }
  }

Future<List<GroupModel>> getGroupForAdmin() async {
    emit(const RemotCalendarState.remoteLoading());
    try {
      final response = await _groupRepo.getAdminAllGroups(await SharedPrefrancesHelpers.getSecuredString('userId'));
      List<GroupModel> result = [];
      response.when(
        success: (group) {
          
          emit(RemotCalendarState.remoteSuccess(group));
          result = group;
          debugPrint(result.length.toString());
        },
        failure: (error) {
          debugPrint('Error fetching group for admin: $error');
          emit(RemotCalendarState.remoteError(error));
        },
      );
      return result;
    } catch (e) {
      emit(RemotCalendarState.remoteError(e.toString()));
      return [];
    }
  }
  void createAppointment(AppointmentEntitiy apt) async {
    emit(const RemotCalendarState.remoteLoading());
    try {
      final createdOne = await _remoteRepo.createAppointment(apt);
      createdOne.when(
        success: (_) {

          print(apt);
          // add to map sefaly (caching data)
          if(appointments.containsKey(apt.startingDate)){
            appointments[apt.startingDate]!.add(apt);
          }else{
            appointments[apt.startingDate] = [apt];
          }
          emit(const RemotCalendarState.remoteSuccess(null));
        },
        failure: (error) {
          debugPrint(
            'error from remote calendar cubit create date ${error.toString()}',
          );
          emit(RemotCalendarState.remoteError(error));
        },
      );
    } catch (e) {
      emit(RemotCalendarState.remoteError(e.toString()));
    }
  }

 void updateAppointment(AppointmentEntitiy apt) async {
    emit(const RemotCalendarState.remoteLoading());
    try {
      final updatedOne = await _remoteRepo.updateAppointment(apt);
      updatedOne.when(
        success: (_) {
          // Update the appointment in the map
          if (appointments.containsKey(apt.startingDate)) {
            final index = appointments[apt.startingDate]!.indexWhere((a) => a.appointmentId == apt.appointmentId);
            if (index != -1) {
              appointments[apt.startingDate]![index] = apt;
            }
          }
          emit(const RemotCalendarState.remoteSuccess(null));
        },
        failure: (error) {
          debugPrint(
            'error from remote calendar cubit update date ${error.toString()}',
          );
          emit(RemotCalendarState.remoteError(error));
        },
      );
    } catch (e) {
      emit(RemotCalendarState.remoteError(e.toString()));
    }
  }
}
