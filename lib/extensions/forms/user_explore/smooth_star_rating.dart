import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class SmoothStarRating extends StatelessWidget {
  const SmoothStarRating({super.key});

  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color? color;

  final Color? borderColor;
  final double size;
  final bool allowHalfRating;
  final IconData filledIconData;
  final IconData halfFilledIconData;
  final IconData defaultIconData;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
