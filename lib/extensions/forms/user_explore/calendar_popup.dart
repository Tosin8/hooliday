import 'dart:ffi';

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
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, _) {
              return AnimatedOpacity(
                opacity: animationController.value,
                duration: Duration(milliseconds: 100),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    if (widget.barrierDismissible) {
                      Navigator.pop(context);
                    }
                  },
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(24.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: const Offset(4, 4),
                                  blurRadius: 8.0)
                            ]),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
