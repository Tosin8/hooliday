import 'package:flutter/material.dart';
import 'package:hooliday/extensions/constants.dart';

class SliderView extends StatefulWidget {
  const SliderView(
      {required this.onChangedlistValue, required this.listValue, super.key});

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
            ),
            SizedBox(
              width: 170,
              child: Text(
                'Less than ${(listValue / 10).toStringAsFixed(1)} Km',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SizedBox(),
              flex: 100 - listValue.round(),
            )
          ],
        ),
        SliderTheme(
            data: SliderThemeData(
              thumbShape: CustomThumbShape(),
            ),
            child: Slider(
              onChanged: (double value) {
                if (mounted) {
                  setState(() {
                    listValue = value;
                  });
                }
                try {
                  widget.onChangedlistValue(listValue);
                } catch (_) {}
              },
              max: 100,
              activeColor: HotelAppTheme.buildLightTheme().primaryColor,
              inactiveColor: Colors.grey.withOpacity(0.4),
              value: listValue,
            )),
      ],
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  static const double _thumbSize = 3.0;
  static const double _disabledThumSize = 3.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled
        ? const Size.fromRadius(_thumbSize)
        : const Size.fromRadius(_disabledThumSize);
  }
}
