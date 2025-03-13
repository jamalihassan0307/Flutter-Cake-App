import 'package:flutter/material.dart';
import 'package:sweet_delights/models/cart_item.dart';
import 'package:sweet_delights/data/items.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.values.fold(0.0, (sum, item) => sum + item.total);
  }

  void updateQuantity(String name, int quantity) {
    if (_items.containsKey(name)) {
      if (quantity > 0) {
        _items.update(
          name,
          (existingItem) => CartItem(
            id: existingItem.id,
            name: existingItem.name,
            image: existingItem.image,
            price: existingItem.price,
            quantity: quantity,
          ),
        );
      } else {
        removeItem(name);
      }
      notifyListeners();
    }
  }

  void addItem(Cakes cake, {int quantity = 1}) {
    if (_items.containsKey(cake.name)) {
      _items.update(
        cake.name,
        (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          image: existingItem.image,
          price: double.parse(cake.price),
          quantity: existingItem.quantity + quantity,
        ),
      );
    } else {
      _items.putIfAbsent(
        cake.name,
        () => CartItem(
          id: DateTime.now().toString(),
          name: cake.name,
          image: cake.image,
          price: double.parse(cake.price),
          quantity: quantity,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String name) {
    _items.remove(name);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
} 