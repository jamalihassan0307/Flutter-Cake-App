import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sweet_delights/core/color.dart';
import 'package:sweet_delights/data/category.dart';

class CategoryButton extends StatelessWidget {
  final Categories category;
  final int selectedIndex;
  final int index;
  final VoidCallback onTap;

  const CategoryButton({
    Key? key,
    required this.category,
    required this.selectedIndex,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.only(right: 12, bottom: 2),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? mainColor : accent2.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: mainColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Row(
          children: [
            if (isSelected) ...[
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  category.image,
                  height: 18,
                  colorFilter: ColorFilter.mode(mainColor, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: 8),
            ],
            Text(
              category.name,
              style: TextStyle(
                color: isSelected ? Colors.white : mainColor,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
