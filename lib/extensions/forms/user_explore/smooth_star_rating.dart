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

  buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        defaultIconData,
        color: borderColor ?? Theme.of(context).primaryColor,
        size: size,
      );
    } else if (index > rating - (allowHalfRating ? 0.5 : 1.0)) {
      icon = Icon(halfFilledIconData,
          color: color ?? Theme.of(context).primaryColor, size: size);
    } else {
      icon = Icon(filledIconData,
          color: color ?? Theme.of(context).primaryColor, size: size);
    }

    return GestureDetector(
      onTap: () => onRatingChanged(index + 1.0),
      onHorizontalDragUpdate: (DragUpdateDetails dragDetails) {
        final RenderBox? box = context.findRenderObject() as RenderBox?;
        final Offset? pos = box?.globalToLocal(dragDetails.globalPosition);
        final double i = pos?.dx ?? 0 / size;
        double rating = allowHalfRating ? i : i.round().toDouble();
        if (rating > starCount) {
          rating = starCount.toDouble();
        }
        if (rating < 0) {
          rating = 0.0;
        }
        onRatingChanged(rating);
      },
      child: icon,
    );
  }
}
