import 'package:uidesign06/data/items.dart';

class Categories {
  final int id;
  final String name;
  final String image;
  final String tag;

  Categories({
    required this.id,
    required this.name,
    required this.image,
    required this.tag,
  });
}

List<Categories> categories = [
  Categories(id: 0, name: 'All Cakes', image: 'assets/icons/birthday-cake.svg', tag: 'all'),
  Categories(id: 1, name: 'Birthday', image: 'assets/icons/cake.svg', tag: 'birthday'),
  Categories(id: 2, name: 'Wedding', image: 'assets/icons/cupcake.svg', tag: 'wedding'),
  Categories(id: 3, name: 'Chocolate', image: 'assets/icons/donut.svg', tag: 'chocolate'),
  Categories(id: 4, name: 'Custom', image: 'assets/icons/cake01.svg', tag: 'custom'),
];

// Function to filter cakes based on category
List<Cakes> getFilteredCakes(String tag, List<Cakes> allCakes) {
  if (tag == 'all') return allCakes;

  return allCakes.where((cake) {
    switch (tag) {
      case 'birthday':
        return cake.name.toLowerCase().contains('birthday');
      case 'wedding':
        return cake.name.toLowerCase().contains('wedding');
      case 'chocolate':
        return cake.flavour.toLowerCase().contains('chocolate');
      case 'custom':
        return cake.price.contains('399.99'); // Example filter for custom cakes
      default:
        return true;
    }
  }).toList();
}
