import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_cubit.dart';
import 'package:appointments/features/calendar/ui/widgets/calendar_view.dart';
import 'package:appointments/features/calendar/ui/widgets/tabview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  void initState() {
    context.read<LocalCalendarCubit>().loadAppointmentsForMonth();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar', style: TextStyles.font18DarkBlueBold),
        leading: IconButton(
          onPressed: () {
           Navigator.pushNamed(context, StringRoutes.addRemoteAppointment);
          },
          icon: const Icon(Icons.refresh),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            children: [
              const CalendarView(), // Calendar always visible

              SizedBox(height: 20.h),

              // Use LocalCalendarCubit state with `when`
              const Expanded(child: TabView()),

              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      StringRoutes.addLocalAppointment,
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
