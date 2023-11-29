import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class SmoothStarRating extends StatelessWidget {
  const SmoothStarRating(
      {super.key,
      required this.starCount,
      required this.rating,
      required this.onRatingChanged,
      this.color,
      this.borderColor,
      required this.size,
      required this.allowHalfRating,
      required this.filledIconData,
      required this.halfFilledIconData,
      required this.defaultIconData,
      required this.spacing});

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
    return Material(
      color: Colors.transparent,
      child: Wrap(
        spacing: spacing,
        children: List<Widget>.generate(
            starCount, (int index) => buildStar(context, index)),
      ),
    );
  }
}
