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

class _CalendarPopupViewState extends State<CalendarPopupView>
    with TickerProviderStateMixin {
  late final DateTime startDate;
  late final DateTime endDate;
  late final AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    startDate = widget.initialStartDate;
    endDate = widget.initialEndDate;
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
