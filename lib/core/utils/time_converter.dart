import 'package:flutter/material.dart';

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