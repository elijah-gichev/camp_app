import 'package:camp_app/kid/widgets/kid_current_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../widgets/shift.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarView calendarView = CalendarView.day;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'calendar',
      createRectTween: createRectTween,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: MyBackButton(),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: SfCalendar(
                  view: CalendarView.day,
                  initialDisplayDate: DateTime.now(),
                  dataSource: MyCalendarDataSource(_getDataSource()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 7, 0, 0);
    final DateTime startTime1 =
        DateTime(today.year, today.month, today.day, 10, 0, 0);
    final DateTime startTime2 =
        DateTime(today.year, today.month, today.day, 18, 0, 0);
    final DateTime endTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime1 =
        DateTime(today.year, today.month, today.day, 15, 0, 0);
    final DateTime endTime2 =
        DateTime(today.year, today.month, today.day, 20, 0, 0);
    meetings.add(
      Meeting('Зарядка', startTime, endTime, Colors.blue, false),
    );
    meetings.add(
      Meeting('Обед', startTime1, endTime1, Colors.red, false),
    );
    meetings.add(
      Meeting('Танцы', startTime2, endTime2, Colors.green, false),
    );
    return meetings;
  }
}

class MyCalendarDataSource extends CalendarDataSource<Meeting> {
  MyCalendarDataSource(List<Meeting> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
