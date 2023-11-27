import 'package:flutter/material.dart';

class CalendarPopupView extends StatefulWidget {
  const CalendarPopupView(
      {this.initialStartDate,
      this.initialEndDate,
      this.onApplyClick,
      this.onCancelClick,
      this.minimumDate,
      this.maximumDate,
      this.barrierDismissible = true,
      super.key});

  @override
  State<CalendarPopupView> createState() => _CalendarPopupViewState();
}

class _CalendarPopupViewState extends State<CalendarPopupView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
