import 'package:flutter/material.dart';

class SliderView extends StatefulWidget {
  const SliderView(
      {required this.onChagedlistValue, required this.listValue, super.key});

  final Function(double) onChangedlistValue;
  final double listValue;
  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double listValue = 50.0;

  @override
  void initState() {
    super.initState();
    listValue = widget.listValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(),
              flex: listValue.round(),
            )
          ],
        )
      ],
    );
  }
}
