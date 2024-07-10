import 'package:flutter/cupertino.dart';
import 'package:uidesign06/core/color.dart';

class Cakes {
  final String name;
  final String flavourl;
  final String image;
  final String price;
  final Color bgColor;
  final String destription;
  final double rating;

  Cakes({
    required this.name,
    required this.flavourl,
    required this.image,
    required this.price,
    required this.bgColor,
    required this.destription,
    required this.rating,
  });
}

List<Cakes> cakes = [
  Cakes(
    name: 'Princess Birthday Cake',
    flavourl: 'Creamy',
    price: '250.60',
    image: 'assets/images/01.png',
    bgColor: pink01,
    destription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    rating: 4.5,
  ),
  Cakes(
    name: 'Birthday Cake',
    flavourl: 'Creamy',
    image: 'assets/images/02.png',
    price: '220.60',
    bgColor: pink01,
    destription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.  ',
    rating: 4,
  ),
  Cakes(
    name: 'Wedding Cake',
    flavourl: 'Creamy',
    price: '450.60',
    image: 'assets/images/03.png',
    bgColor: pink01,
    destription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.  ',
    rating: 2.5,
  ),
  Cakes(
    name: 'Cup Cake',
    flavourl: 'Creamy',
    image: 'assets/images/04.png',
    price: '850.60',
    bgColor: pink01,
    destription:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. ',
    rating: 5,
  ),
];
