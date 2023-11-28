import 'package:flutter/material.dart';

class CustomCalendarView extends StatefulWidget {
  const CustomCalendarView(
      {required this.initialStartDate,
      required this.initialEndDate,
      required this.startEndDateChange,
      this.minimumDate,
      this.maximumDate,
      super.key});

  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final DateTime initialStartDate;
  final DateTime initialEndDate;

  final Function(DateTime, DateTime) startEndDateChange;

  @override
  State<CustomCalendarView> createState() => _CustomCalendarViewState();
}

class _CustomCalendarViewState extends State<CustomCalendarView> {
  List<DateTime> dateList = <DateTime>[];
  DateTime currentMonthDate = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setListOfDate(currentMonthDate);
    startDate = widget.initialStartDate;
    endDate = widget.initialEndDate;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void setListOfDate(DateTime monthDate) {
    dateList.clear();
    final DateTime newDate = DateTime(monthDate.year, monthDate.month, 0);
    int previousMonthDay = 0;
    if (newDate.weekday < 7) {
      previousMonthDay = newDate.weekday;
      for (int i = 0; i <= previousMonthDay; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMonthDay - i)));
      }
    }

    for (int i = 0; i < (42 - previousMonthDay); i++) {
      dateList.add(newDate.add(Duration(days: i + 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [Padding(padding: padding)]),
    );
  }
}
