import 'package:appointments/core/thems/colors.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/calendar_cubit/cubit/calendar_state.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});
  static DateTime? selectedDate;
  static DateTime? focusedDay;
  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        state.whenOrNull(dayChanged: (selectedDay, focusedDay) {
         CalendarView.selectedDate = selectedDay ;
         CalendarView.focusedDay = focusedDay;
        },);
        return TableCalendar(
          firstDay: DateTime(2020, 1, 1),
          lastDay: DateTime(2030, 12, 31),
          focusedDay: DateTime.now(),
          selectedDayPredicate: (day) => isSameDay(day, CalendarView.selectedDate),
          onDaySelected: (selectedDay, focusedDay) {
            CalendarView.selectedDate = selectedDay;
            context.read<CalendarCubit>().onDaySelected(selectedDay,focusedDay);
            context.read<LocalCalendarCubit>().loadAppointmentsForDay(selectedDay);
            context.read<RemotCalendarCubit>().loadAppointmentsForDay(selectedDay);
          },
          
          calendarStyle: CalendarStyle(
            todayTextStyle: TextStyles.font13DarkBlueRegular,
            todayDecoration: const BoxDecoration(
              color: ColorsManager.mainBlue,
              shape: BoxShape.circle,
            ),
            selectedDecoration: const BoxDecoration(
              color: ColorsManager.mainBlue,
              shape: BoxShape.circle,
            ),
          ),
          
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(fontWeight: FontWeight.w600),
            weekendStyle: TextStyle(fontWeight: FontWeight.w600),
          ),
          eventLoader: (day) {
            final appointmentsMap = context.watch<LocalCalendarCubit>().appointmentsMap;
            final rempteMap = context.watch<RemotCalendarCubit>().appointments;
            final normalizedDay = DateTime(day.year, day.month, day.day);
            return (appointmentsMap[normalizedDay] ?? []) + (rempteMap[normalizedDay] ?? []);
          },
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              final events = context.watch<LocalCalendarCubit>().appointmentsMap;
               final rempteMap = context.watch<RemotCalendarCubit>().appointments;
              final normalizedDay = DateTime(day.year, day.month, day.day);
              return _buildDayCell(
                normalizedDay,
                ((events[normalizedDay]?.length ?? 0) + (rempteMap[normalizedDay]?.length ?? 0)),
              );
            },
            markerBuilder: (context, day, events) {
              return const SizedBox.shrink();
            },
            selectedBuilder: (context, day, focusedDay) {
              final events = context.watch<LocalCalendarCubit>().appointmentsMap;
              final rempteMap = context.watch<RemotCalendarCubit>().appointments;
              final normalizedDay = DateTime(day.year, day.month, day.day);
              return _buildDayCell(
                normalizedDay,
                ((events[normalizedDay]?.length ?? 0) + (rempteMap[normalizedDay]?.length ?? 0)),
                isSelected: true,
              );
            },
            todayBuilder: (context, day, focusedDay) {
              final events = context.watch<LocalCalendarCubit>().appointmentsMap;
               final rempteMap = context.watch<RemotCalendarCubit>().appointments;
              final normalizedDay = DateTime(day.year, day.month, day.day);
              return _buildDayCell(
                normalizedDay,
                ((events[normalizedDay]?.length ?? 0) + (rempteMap[normalizedDay]?.length ?? 0)),
                isToday: true,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildDayCell(
    DateTime day,
    int eventCount, {
    bool isSelected = false,
    bool isToday = false,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCubic,
          width: 50.h,
          height: 50.h,
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.mainBlue
                : isToday
                    ? ColorsManager.gray
                    : Colors.transparent,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '${day.day}',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (eventCount > 0)
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              
              padding: const EdgeInsets.all(4),
              decoration:  BoxDecoration(
                color: isSelected ? ColorsManager.gray: ColorsManager.mainBlue,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$eventCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
