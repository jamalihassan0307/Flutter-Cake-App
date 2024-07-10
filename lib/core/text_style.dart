import 'package:flutter/material.dart';
import 'package:uidesign06/core/color.dart';

const TextStyle txtHeading = TextStyle(
  fontSize: 34.0,
  color: mainColor,
  shadows: [
    BoxShadow(
      color: pink01,
      blurRadius: 1,
      offset: Offset(0, 3),
    ),
  ],
  fontWeight: FontWeight.bold,
);

const TextStyle txtBtnCategory = TextStyle(
  fontSize: 18.0,
  color: white,
  fontWeight: FontWeight.w400,
);

const TextStyle txtItemCard = TextStyle(
  fontSize: 18.0,
  color: black,
  fontWeight: FontWeight.w600,
);
