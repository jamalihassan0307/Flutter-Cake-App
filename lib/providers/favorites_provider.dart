import 'package:flutter/material.dart';
import 'package:sweet_delights/data/items.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Cakes> _favorites = [];

  List<Cakes> get favorites => _favorites;

  bool isFavorite(Cakes cake) {
    return _favorites.any((item) => item.name == cake.name);
  }

  void toggleFavorite(Cakes cake) {
    if (isFavorite(cake)) {
      _favorites.removeWhere((item) => item.name == cake.name);
    } else {
      _favorites.add(cake);
    }
    notifyListeners();
  }
} 