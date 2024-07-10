import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uidesign06/core/color.dart';

class CircleButton extends StatelessWidget {
  final Function() onTap;
  final String image;
  final Color? bgColor;
  final Color? iconColor;
  final double? size;
  const CircleButton({
    Key? key,
    required this.onTap,
    required this.image,
    this.bgColor,
    this.size,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size != null ? size : 50.0,
        width: size != null ? size : 50.0,
        padding: EdgeInsets.all(size != null ? 8.0 : 15.0),
        decoration: BoxDecoration(
          color: bgColor != null ? bgColor : white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: blackShadow,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: SvgPicture.asset(
          'assets/icons/$image',
          color: iconColor != null ? iconColor : grayColor,
        ),
      ),
    );
  }
}
