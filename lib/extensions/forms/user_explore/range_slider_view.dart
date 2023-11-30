import 'package:flutter/material.dart';
import 'package:hooliday/extensions/constants.dart';

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
    return Column(
      children: [
        Stack(children: [
          Row(
            children: [
              Expanded(
                child: const SizedBox(),
                flex: _values.start.round(),
              ),
              SizedBox(
                width: 54,
                child: Text(
                  '\$${_values.start.round()}',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1000 - _values.start.round(),
                child: const SizedBox(),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: _values.end.round(),
                child: const SizedBox(),
              ),
              SizedBox(
                width: 54,
                child: Text(
                  '\$${_values.end.round()}',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: SizedBox(),
                flex: 1000 - _values.end.round(),
              )
            ],
          )
        ]),
        SliderTheme(
            data: SliderThemeData(
              rangeThumbShape: CustomRangeThumbShape(),
            ),
            child: RangeSlider(
                values: _values,
                max: 1000.0,
                activeColor: HotelAppTheme.buildLightTheme().primaryColor,
                inactiveColor: Colors.grey.withOpacity(0.4),
                divisions: 1000,
                onChanged: (RangeValues values) {
                  try {
                    if (mounted) {
                      setState(() {
                        _values = values;
                      });
                    }
                    widget.onChangeRangeValues(_values);
                  } catch (_) {}
                }))
      ],
    );
  }
}
