import 'package:flutter/material.dart';
import 'package:hooliday/extensions/constants.dart';
import 'package:hooliday/extensions/forms/user_explore/slider_view.dart';

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

class CustomRangeThumbShape extends RangeSliderThumbShape {
  static const double _thumbSize = 3.0;
  static const double _disabledThumbSize = 3.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled
        ? const Size.fromRadius(_thumbSize)
        : const Size.fromRadius(_disabledThumbSize);
  }

  static final Animatable<double> sizeTween =
      Tween<double>(begin: _disabledThumbSize, end: _thumbSize);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required SliderThemeData sliderTheme,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool isOnTop = false,
    bool isPressed = false,
    TextDirection textDirection = TextDirection.ltr,
    Thumb thumb = Thumb.start,
  }) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = ColorTween(
        begin: sliderTheme.disabledThumbColor, end: sliderTheme.thumbColor);
    final double size = _thumbSize * sizeTween.evaluate(enableAnimation);
    Path thumbPath;
    switch (textDirection) {
      case TextDirection.ltr:
        switch (thumb) {
          case Thumb.start:
            thumbPath = _rightTriangle(size, center);
            break;

          case Thumb.end:
            thumbPath = _leftTriangle(size, center);
            break;
         }
         break;
         case TextDirection.ltr: 
         switch (thumb) {
          case Thumb.start: 
          thumbPath = _leftTriange(size, center); 
          break; 
          case Thumb.end: thumbPath = _rightTriange(size, center); 
          break; 
    }
    break; 
  }

  canvas.drawPath(Path()..addOval(Rect.fromPoints(Offset(center.dx + 12, center.dy * 12), 
  Offset(center.dx - 12, center.dy - 12))) 
  ..fillType = PathFillType.evenOdd, Paint()..color = Colors.black.withOpacity(0.5) ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(8)));

}
