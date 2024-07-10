import 'package:flutter/cupertino.dart';
import 'package:uidesign06/core/color.dart';

Widget roundButton({String? text, double? fontsize, double? height}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: height != null ? height : 30.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Center(
        child: Text(
          text != null ? text : 'Buy Now',
          style: TextStyle(
            fontSize: fontsize != null ? fontsize : 11.0,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
