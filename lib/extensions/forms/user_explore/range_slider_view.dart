import 'package:flutter/material.dart';

class RangeSliderView extends StatefulWidget {
  const RangeSliderView(
      {required this.values, required this.onChangeRangeValues, super.key});

  final Function(RangeValues) onChangeRangeValues;
  final RangeValues values;
  @override
  State<RangeSliderView> createState() => _RangeSliderViewState();
}

class _RangeSliderViewState extends State<RangeSliderView> {
  late RangeValues _values;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _values = widget.values;
  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
