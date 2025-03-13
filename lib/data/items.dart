import 'package:flutter/material.dart';
import 'package:uidesign06/core/color.dart';

class Cakes {
  final String name;
  final String flavour;
  final String image;
  final String price;
  final Color bgColor;
  final String description;
  final double rating;

  Cakes({
    required this.name,
    required this.flavour,
    required this.image,
    required this.price,
    required this.bgColor,
    required this.description,
    required this.rating,
  });
}

List<Cakes> cakes = [
  Cakes(
    name: 'White Wedding Cake',
    flavour: 'Vanilla',
    price: '299.99',
    image: 'assets/images/white-icing-covered-cake-on-white-plate-chocolate-cake-sponge-cake-mousse-frosting-icing-carrot-cake-bolo-cream-food.png',
    bgColor: pink01,
    description: 'Elegant white wedding cake with delicate frosting and multiple tiers. Perfect for your special day.',
    rating: 4.8,
  ),
  Cakes(
    name: 'Classic White Cake',
    flavour: 'Vanilla',
    image: 'assets/images/white_cake.png',
    price: '149.99',
    bgColor: pink02,
    description: 'Traditional white cake with smooth frosting and elegant decorations.',
    rating: 4.5,
  ),
  Cakes(
    name: 'Strawberry Delight',
    flavour: 'Strawberry',
    price: '179.99',
    image: 'assets/images/strawberry_cake.png',
    bgColor: pink03,
    description: 'Fresh strawberry cake with cream cheese frosting and real fruit pieces.',
    rating: 4.7,
  ),
  Cakes(
    name: 'Chocolate Fudge',
    flavour: 'Chocolate',
    image: 'assets/images/slice-of-chocolate-cake-chocolate-cake-sachertorte-birthday-cake-fudge-cake-chocolate-cake-baked-goods-food.png',
    price: '189.99',
    bgColor: accent2,
    description: 'Rich chocolate fudge cake with ganache frosting and chocolate shavings.',
    rating: 4.9,
  ),
  Cakes(
    name: 'Birthday Special',
    flavour: 'Vanilla',
    price: '159.99',
    image: 'assets/images/one-sliced-white-happy-birthday-cake-illustration-birthday-cake-cake-in-cream-food.png',
    bgColor: pink01,
    description: 'Festive birthday cake with colorful decorations and sprinkles.',
    rating: 4.6,
  ),
  Cakes(
    name: 'Wedding Layer Cake',
    flavour: 'Mixed',
    image: 'assets/images/layer-cake-wedding-cake-sugar-cake-torte-wedding-cake-baking-cake-decorating.png',
    price: '399.99',
    bgColor: accent2,
    description: 'Multi-layered wedding cake with intricate designs and premium ingredients.',
    rating: 5.0,
  ),
  // Add more cakes as needed
];
