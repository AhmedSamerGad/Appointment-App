import 'package:appointments/core/routing/routes.dart';
import 'package:appointments/core/thems/styles.dart';
import 'package:appointments/features/calendar/logic/cubit/local_calendar_cubit/cubit/local_calendar_cubit.dart';
import 'package:appointments/features/calendar/logic/cubit/remot_calendar_cubit/cubit/remot_calendar_cubit.dart';
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
    context.read<RemotCalendarCubit>().getAppointmentsForCurrentUser();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule ', style: TextStyles.font18DarkBlueBold),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
           // Navigator.pushNamed(context, StringRoutes.addRemoteAppointment);
            context.read<RemotCalendarCubit>().getAppointmentsForCurrentUser();
          },
        
          icon: const Icon(Icons.refresh),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.h),
          child: Column(
            children: [
               CalendarView(), // Calendar always visible

              SizedBox(height: 20.h),

              // Use LocalCalendarCubit state with `when`
              const Expanded(child: TabView()),

              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return  AlertDialog(
                          title: const Text('Add Appointment'),
                          // content: Text('Content for adding appointment'),
                          actions: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(onPressed: (){
                                  Navigator.pushNamed(context, StringRoutes.addLocalAppointment);
                                }, child:  Text('Personal Appointment' ,style: TextStyles.font16BlackMedium,)),
                                 SizedBox(height: 10.h),
                                TextButton(onPressed: (){
                                  Navigator.pushNamed(context, StringRoutes.addRemoteAppointment);
                                }, child:  Text('Team Appointment' ,style: TextStyles.font16BlackMedium,)),
                              ],
                            )
                          ],
                        );
                      },
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
