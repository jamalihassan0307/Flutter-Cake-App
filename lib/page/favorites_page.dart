import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweet_delights/core/color.dart';
import 'package:sweet_delights/providers/favorites_provider.dart';
import 'package:sweet_delights/providers/cart_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Favorites',
          style: TextStyle(color: mainColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: mainColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          if (favoritesProvider.favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 100, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'No favorites yet',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: favoritesProvider.favorites.length,
            itemBuilder: (context, index) {
              final cake = favoritesProvider.favorites[index];
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: cake.bgColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(cake.image),
                  ),
                  title: Text(cake.name),
                  subtitle: Text('\$${cake.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.shopping_cart, color: mainColor),
                        onPressed: () {
                          context.read<CartProvider>().addItem(cake);
                          Fluttertoast.showToast(
                            msg: 'Added to cart',
                            backgroundColor: mainColor,
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite, color: mainColor),
                        onPressed: () {
                          favoritesProvider.toggleFavorite(cake);
                          Fluttertoast.showToast(
                            msg: 'Removed from favorites',
                            backgroundColor: mainColor,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
} 