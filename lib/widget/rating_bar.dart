import 'package:flutter/material.dart';
import 'package:uidesign06/core/color.dart';

class StarRating extends StatelessWidget {
  final double rating;
  const StarRating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(5, (index) => buildStar(index)));
  }

  Widget buildStar(int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star,
        color: gray02,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: ratingC,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: ratingC,
      );
    }
    return icon;
  }
}
