import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 4.0, bottom: 4),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(24.0)),
                        border: Border.all(color: Colors.blueAccent)),
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24.0)),
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            currentMonthDate = DateTime(currentMonthDate.year,
                                currentMonthDate.month, 0);
                            setListOfDate(currentMonthDate);
                          });
                        }
                      },
                      child: const Icon(Icons.keyboard_arrow_left,
                          color: Colors.grey),
                    ),
                  ),
                ),
                Expanded(
                    child: Center(
                  child: Text(
                    DateFormat('MMMM, yyyy').format(currentMonthDate),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        border: Border.all(color: Colors.blueAccent)),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            currentMonthDate = DateTime(currentMonthDate.year,
                                currentMonthDate.month + 2, 0);
                            setListOfDate(currentMonthDate);
                          });
                        }
                      },
                      child:
                          Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
            child: Row(
              children: getDaysNameUI(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Column(
              children: getDaysNoUI(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getDaysNameUI() {
    final List<Widget> listUI = <Widget>[];
    for (int i = 0; i < 7; i++) {
      listUI.add(Expanded(
          child: Center(
        child: Text(
          DateFormat('EEE').format(dateList[i]),
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue),
        ),
      )));
    }
    return listUI;
  }

  List<Widget> getDaysNoUI() {
    final List<Widget> noList = <Widget>[];
    int count = 0; 
    for(int i = 0; i < dateList.length /7 ; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i< 7; i++) {
        final DateTime date = dateList[count]; 
        listUI.add(
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.0, 
              child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 3, 
                  bottom: 3
                  ),
                   child: Padding(
                    padding: EdgeInsets.only(
                      top: 2,
                       bottom: 2, 
                       left: isStartDateRadius(date) ? 4:0, 
                       right: isEndDateRadius(date) ? 4: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: startDate != null && endDate != null ? getIsItStartAndEndDate(date) || 
                            getIsInRange(date) ? Colors.blue.withOpacity(0.4) 
                            : Colors.transparent : Colors.transparent,
                            borderRadius: BorderRadius.only(
                              bottomLeft: isStartDateRadius(date) 
                              ? const Radius.circular(24.0) 
                              : const Radius.circular(0.0), 
                              topLeft: isStartDateRadius(date) 
                              ? const Radius.circular(24.0)
                              : const Radius.circular(0.0), 
                              topRight: isEndDateRadius(date) 
                              ? const Radius.circular(24.0) : const Radius.circular(0.0), 
                            ), 
                            ),
                            ),
                            ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)),
                              onTap:() {
                                if(currentMonthDate.month == date.month) {
                                  final DateTime? minimumDate = widget.minimumDate;
                                  final DateTime? maximumDate = widget.maximumDate;
                                  if(minimumDate != null && maximumDate != null) {
                                    final DateTime newminimumDate = DateTime(minimumDate.year, minimumDate.month, minimumDate.day - 1);
                                    final DateTime newmaximumDate = DateTime(maximumDate.year, maximumDate.month, maximumDate.day - 1);
                                }
                              },
                            )
            ],
          ),))
        );
  }
}
  