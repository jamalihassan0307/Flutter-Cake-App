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
    name: 'Three Layer Cake',
    flavour: 'Vanilla & Cream',
    image: 'assets/images/3-layer-cake-birthday-cake-cupcake-bakery-wedding-cake-christmas-cake-cake-cream-child.png',
    price: '189.99',
    bgColor: pink01,
    description:
        'Delightful three-layer cake perfect for special occasions. Features smooth cream and elegant decorations.',
    rating: 4.7,
  ),
  Cakes(
    name: 'Watercolor Cake',
    flavour: 'Assorted',
    image:
        'assets/images/assorted-cakes-illustration-birthday-cake-watercolor-painting-wedding-cake-watercolor-cake-watercolor-leaves-painted.png',
    price: '249.99',
    bgColor: accent2,
    description:
        'Artistic watercolor-style cake with beautiful hand-painted designs. A true masterpiece for any celebration.',
    rating: 4.9,
  ),
  Cakes(
    name: 'Black Forest Gateau',
    flavour: 'Chocolate Cherry',
    image:
        'assets/images/black-forest-cake-birthday-cake-chocolate-cake-christmas-cake-fruitcake-wedding-cake-birthday-cake-cream-food.png',
    price: '199.99',
    bgColor: pink03,
    description: 'Classic Black Forest cake with layers of chocolate, cherries, and whipped cream.',
    rating: 4.8,
  ),
  Cakes(
    name: 'Premium Chocolate',
    flavour: 'Dark Chocolate',
    image: 'assets/images/black_chocholate_cake.png',
    price: '169.99',
    bgColor: accent1,
    description: 'Rich dark chocolate cake with premium cocoa and smooth ganache finish.',
    rating: 4.9,
  ),
  Cakes(
    name: 'Cheesecake Supreme',
    flavour: 'Mixed Berries',
    image:
        'assets/images/cheesecake-chocolate-cake-strawberry-cream-cake-shortcake-swiss-roll-dessert-cake-food-recipe.png',
    price: '159.99',
    bgColor: pink02,
    description: 'Creamy cheesecake topped with fresh mixed berries and a graham cracker crust.',
    rating: 4.6,
  ),
  Cakes(
    name: 'Chocolate Brownie Cake',
    flavour: 'Double Chocolate',
    image:
        'assets/images/chocolate-cake-birthday-cake-sponge-cake-chocolate-brownie-torte-cake-platter-food-baking.png',
    price: '179.99',
    bgColor: accent2,
    description: 'Decadent chocolate brownie cake with fudgy center and chocolate ganache.',
    rating: 4.8,
  ),
  Cakes(
    name: 'Frutti di Bosco',
    flavour: 'Forest Fruits',
    image: 'assets/images/chocolate-cake-birthday-cake-tart-bakery-cheesecake-fruit-cake-cream-frutti-di-bosco.png',
    price: '209.99',
    bgColor: pink01,
    description: 'Elegant fruit cake with fresh forest berries and light cream filling.',
    rating: 4.7,
  ),
  Cakes(
    name: 'Chocolate Truffle',
    flavour: 'Dark Chocolate',
    image:
        'assets/images/chocolate-cake-chocolate-truffle-chocolate-cake-black-forest-gateau-birthday-cake-bakery-delicious-cakes-food-cake-decorating.png',
    price: '229.99',
    bgColor: accent1,
    description: 'Luxurious chocolate truffle cake with rich chocolate layers and decorative finish.',
    rating: 4.9,
  ),
  Cakes(
    name: 'Dripping Ganache',
    flavour: 'Chocolate',
    image: 'assets/images/chocolate-cake-ganache-dripping-cake-torte-cake-decorating-cake-cream-food.png',
    price: '189.99',
    bgColor: pink03,
    description: 'Stunning chocolate cake with perfectly dripped ganache decoration.',
    rating: 4.8,
  ),
  Cakes(
    name: 'Ice Cream Cake',
    flavour: 'Mixed',
    image: 'assets/images/chocolate-cake-ice-cream-cake-cupcake-birthday-cake-cake-cream-food.png',
    price: '169.99',
    bgColor: accent2,
    description: 'Delicious ice cream cake perfect for summer celebrations.',
    rating: 4.6,
  ),
  Cakes(
    name: 'Classic Cupcake',
    flavour: 'Vanilla',
    image: 'assets/images/cupcake-birthday-cake-icing-cake-candle-cream-food.png',
    price: '39.99',
    bgColor: pink02,
    description: 'Perfect individual cupcakes with classic vanilla frosting.',
    rating: 4.5,
  ),
  Cakes(
    name: 'Gourmet Cupcake',
    flavour: 'Assorted',
    image:
        'assets/images/cupcake-with-toppings-cupcake-frosting-icing-chocolate-cake-birthday-cake-profiterole-cupcakes-cream-food.png',
    price: '49.99',
    bgColor: accent1,
    description: 'Gourmet cupcakes with premium toppings and decorations.',
    rating: 4.7,
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
    image:
        'assets/images/slice-of-chocolate-cake-chocolate-cake-sachertorte-birthday-cake-fudge-cake-chocolate-cake-baked-goods-food.png',
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
  Cakes(
    name: 'White Wedding Cake',
    flavour: 'Vanilla',
    price: '299.99',
    image:
        'assets/images/white-icing-covered-cake-on-white-plate-chocolate-cake-sponge-cake-mousse-frosting-icing-carrot-cake-bolo-cream-food.png',
    bgColor: pink01,
    description: 'Elegant white wedding cake with delicate frosting and multiple tiers. Perfect for your special day.',
    rating: 4.8,
  ),
  // Add more cakes as needed
];
