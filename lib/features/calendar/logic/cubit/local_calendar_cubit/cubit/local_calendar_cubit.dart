// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'package:appointments/features/calendar/data/repo/calendar_repo.dart';
import 'package:appointments/features/calendar/domin/appointment_entitiy.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalCalendarCubit extends Cubit<LocalCalendarState> {
  LocalCalendarCubit(this._calendarRepo) : super(const LocalCalendarState.loading());
  final CalendarRepo _calendarRepo;

  final Map<DateTime, List<AppointmentEntitiy>> _appointmentsMap = {};
  final Map<int, AppointmentEntitiy> _appointmentIds = {};

  // Public getters
  Map<DateTime, List<AppointmentEntitiy>> get appointmentsMap =>
      _appointmentsMap;
  Map<int, AppointmentEntitiy> get appointmentIds => _appointmentIds;

  Future<void> loadAppointmentsForMonth() async {
    emit(const LocalCalendarState.loading());
    try {
      final now = DateTime.now();
      final result = await _calendarRepo.getAppointmentsForMonth(now);

      result.when(
        success: (appointments) {
          _removeAppointmentsForMonth(now);
          _addAppointmentsToCache(appointments);

          appointments.where((appointment) => appointment != null).toList();

          emit(LocalCalendarState.success(appointments));
        },
        failure: (error) => emit(LocalCalendarState.error(error)),
      );
    } catch (e) {
      emit(LocalCalendarState.error(e.toString()));
    }
  }

  Future<List<AppointmentEntitiy>> loadAppointmentsForDay(DateTime day) async {
    emit(const LocalCalendarState.loading());
    final normalizedDay = DateTime(day.year, day.month, day.day);

    // If we already fetched this day, return cached data
    if (_appointmentsMap.containsKey(normalizedDay)) {
      emit(LocalCalendarState.success(_appointmentsMap[normalizedDay]!));
      return _appointmentsMap[normalizedDay]!;
    }

    try {
      final result = await _calendarRepo.getAppointmentsForDay(day);
      return result.when(
        success: (data) {
          _appointmentsMap[normalizedDay] = data;
          emit(LocalCalendarState.success(data));
          return data;
        },
        failure: (message) {
          debugPrint('Error loading appointments: $message');
          emit(LocalCalendarState.error(message));
          return [];
        },
      );
    } catch (e) {
      print(e);
      emit(LocalCalendarState.error(e.toString()));
      return [];
    }
  }

  Future<void> updateAppointment(
    int id,
    AppointmentEntitiy newAppointment,
  ) async {
    emit(const LocalCalendarState.loading());

    print('[CUBIT] Updating appointment with ID: $id');
    print('[CUBIT] New appointment data: ${newAppointment.toModel()}');

    final updateResult = await _calendarRepo.updateAppointment(newAppointment);

    updateResult.when(
      success: (_) {
        print('[CUBIT] Update successful');

        final normalizedNewDate = DateTime(
          newAppointment.startingDate.year,
          newAppointment.startingDate.month,
          newAppointment.startingDate.day,
        );

        print('[CUBIT] Normalized new date: $normalizedNewDate');
        print('[CUBIT] Before removal: $_appointmentsMap');

        // Find and remove the old appointment from ANY date
        bool removed = false;
        _appointmentsMap.forEach((date, appointments) {
          final initialLength = appointments.length;
          appointments.removeWhere((apt) => apt.appointmentId == id);
          if (appointments.length != initialLength) {
            removed = true;
            print('[CUBIT] Removed appointment from date: $date');
          }
        });

        if (!removed) {
          print('[CUBIT] Warning: No appointment found with ID $id to remove');
        }

        print('[CUBIT] After removal: $_appointmentsMap');

        // Add updated appointment to new date
        _appointmentsMap[normalizedNewDate] ??= [];
        _appointmentsMap[normalizedNewDate]!.add(newAppointment);

        // Update by ID map
        appointmentIds[id] = newAppointment;

        print('[CUBIT] After addition: $_appointmentsMap');

        emit(LocalCalendarState.success(_appointmentsMap));
      },
      failure: (error) {
        print('[CUBIT] Update failed: $error');
        emit(LocalCalendarState.error(error));
      },
    );
  }

  void createAppointment(AppointmentEntitiy appointment) async {
    emit(const LocalCalendarState.loading());

    final normalizedDay = DateTime(
      appointment.startingDate.year,
      appointment.startingDate.month,
      appointment.startingDate.day,
    );

    print('Creating appointment for date: $normalizedDay');
    final parseTime = appointment.startingTime;
    final hour = parseTime.hour;
    final minute = parseTime.minute;

    final parseEndingTime = appointment.endingTime;
    final endingHour = parseEndingTime?.hour;
    final endingMinute = parseEndingTime?.minute;

    // Validate starting time
    final isAvailable = await _calendarRepo.isStartingTimeValid(
      normalizedDay,
      TimeOfDay(hour: hour, minute: minute),
      appointment.endingTime != null
          ? TimeOfDay(hour: endingHour!, minute: endingMinute!)
          : null,
    );

    isAvailable.when(
      success: (app) async {
        final result = await _calendarRepo.createAppointment(appointment);

        result.when(
          success: (_) {
            debugPrint('Created appointment successfully');
            final normalizedDay = DateTime(
              appointment.startingDate.year,
              appointment.startingDate.month,
              appointment.startingDate.day,
            );

            // Add the new appointment to the map
            if (_appointmentsMap.containsKey(normalizedDay)) {
              _appointmentsMap[normalizedDay]!.add(appointment);
            } else {
              _appointmentsMap[normalizedDay] = [appointment];
            }

            loadAppointmentsForDay(normalizedDay);

            emit(LocalCalendarState.success([appointment]));
          },
          failure: (error) {
            emit(LocalCalendarState.error(error.toString()));
          },
        );
      },
      failure: (error) {
        debugPrint('Error creating appointments: $error');
        emit(LocalCalendarState.error(error.toString()));
      },
    );
  }

  void deleteAppointment(int id) async {
    emit(const LocalCalendarState.loading());
    final appointment = _appointmentsMap.values
        .expand((list) => list)
        .firstWhere((apt) => apt.appointmentId == id);
    final result = await _calendarRepo.deleteAppointment(
      appointment.appointmentId!,
    );
    result.when(
      success: (_) {
        final normalizedDay = DateTime(
          appointment.startingDate.year,
          appointment.startingDate.month,
          appointment.startingDate.day,
        );

        _appointmentsMap[normalizedDay]?.removeWhere(
          (apt) => apt.appointmentId == appointment.appointmentId,
        );

        emit(LocalCalendarState.success(_appointmentsMap[normalizedDay] ?? []));
      },
      failure: (e) {
        emit(LocalCalendarState.error(e.toString()));
      },
    );
  }

  TimeOfDay getStartingTime(String time) {
    try {
      final parts = time.split(' ');
      if (parts.length != 2) {
        throw const FormatException('Invalid time format');
      }

      final timeParts = parts[0].split(':');
      if (timeParts.length != 2) {
        throw const FormatException('Invalid time format');
      }

      int hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      final period = parts[1].toUpperCase();

      if (hour < 1 || hour > 12 || minute < 0 || minute > 59) {
        throw const FormatException('Invalid time values');
      }

      if (period == 'PM' && hour != 12) {
        hour += 12;
      } else if (period == 'AM' && hour == 12) {
        hour = 0;
      }

      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      print('❌ Error parsing time "$time": $e');
      throw FormatException('Invalid time input: "$time" — $e');
    }
  }

  AppointmentEntitiy? getAllAppointmentsById(
    int id,
    Map<int, AppointmentEntitiy> original,
  ) {
    return original[id];
  }

  void _addAppointmentsToCache(List<AppointmentEntitiy> appointments) {
    for (final appointment in appointments) {
      final normalizedDate = DateTime(
        appointment.startingDate.year,
        appointment.startingDate.month,
        appointment.startingDate.day,
      );

      _appointmentsMap[normalizedDate] ??= [];
      _appointmentsMap[normalizedDate]!.add(appointment);
      _appointmentIds[appointment.appointmentId!] = appointment;
    }
  }

  void _removeAppointmentsForMonth(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);

    _appointmentsMap.removeWhere(
      (date, _) =>
          date.isAfter(firstDay.subtract(const Duration(days: 1))) &&
          date.isBefore(lastDay.add(const Duration(days: 1))),
    );

    _appointmentIds.removeWhere(
      (_, apt) =>
          apt.startingDate.isAfter(
            firstDay.subtract(const Duration(days: 1)),
          ) &&
          apt.startingDate.isBefore(lastDay.add(const Duration(days: 1))),
    );
  }
}
