import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uidesign06/core/color.dart';
import 'package:uidesign06/core/text_style.dart';
import 'package:uidesign06/data/category.dart';

class CategoryButton extends StatelessWidget {
  final Categories category;
  final int index;
  const CategoryButton({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      margin: EdgeInsets.only(top: 30.0, right: 20.0),
      padding: index == category.id
          ? EdgeInsets.only(left: 5.0, right: 10.0)
          : EdgeInsets.symmetric(horizontal: 10.0),
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: index == category.id ? mainColor : pink01,
      ),
      child: index == category.id
          ? Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: white,
                  child: SvgPicture.asset(
                    category.image,
                    height: 20.0,
                  ),
                ),
                SizedBox(width: 15.0),
                Text(
                  category.name,
                  style: txtBtnCategory,
                )
              ],
            )
          : SvgPicture.asset(
              category.image,
              height: 30.0,
            ),
    );
  }
}
