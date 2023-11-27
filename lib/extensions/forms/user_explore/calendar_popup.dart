import 'package:flutter/material.dart';

class CalendarPopupView extends StatefulWidget {
  const CalendarPopupView(
      {required this.initialStartDate,
      required this.initialEndDate,
      required this.onApplyClick,
      required this.onCancelClick,
      this.minimumDate,
      this.maximumDate,
      this.barrierDismissible = true,
      super.key});

  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final bool barrierDismissible;
  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final Function(DateTime, DateTime) onApplyClick;
  final Function onCancelClick;
  @override
  State<CalendarPopupView> createState() => _CalendarPopupViewState();
}

class _CalendarPopupViewState extends State<CalendarPopupView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
