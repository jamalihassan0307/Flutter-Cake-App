import 'package:flutter/material.dart';
import 'package:uidesign06/core/color.dart';
import 'package:uidesign06/core/text_style.dart';
import 'package:uidesign06/data/items.dart';
import 'package:uidesign06/widget/round_btn.dart';

class ItemCard02 extends StatelessWidget {
  final Cakes cake;
  const ItemCard02({Key? key, required this.cake}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80.0,
            width: 250.0,
            margin: EdgeInsets.only(right: 15.0, left: 10.0),
            padding: EdgeInsets.only(bottom: 20.0, left: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: blackShadow,
                    offset: Offset(0, 5),
                    blurRadius: 10,
                  )
                ]),
          ),
        ),
        Container(
          height: 80.0,
          width: 80.0,
          margin: EdgeInsets.only(right: 15.0, left: 10.0),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            color: pink02,
          ),
          child: Image.asset(
            cake.image,
            scale: 2,
          ),
        ),
        Positioned(
          right: 25.0,
          bottom: 10.0,
          child: Container(
            width: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cake.name,
                  maxLines: 1,
                  style: txtItemCard.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Flavor: ${cake.flavourl}',
                  maxLines: 1,
                  style: txtItemCard.copyWith(
                    fontSize: 12,
                    color: grayColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$',
                            style: txtHeading.copyWith(fontSize: 10.0),
                          ),
                          TextSpan(
                            text: cake.price,
                            style: txtHeading.copyWith(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    roundButton(height: 20.0),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
