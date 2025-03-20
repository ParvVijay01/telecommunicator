import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _items = [];

  List<Map<String, dynamic>> get items => _items;

  void addItem({
    required dynamic id,
    required String title,
    required double? price, // Nullable price
    required double? originalPrice, // Nullable original price
    required String image,
  }) {
    _items.add({
      'id': id,
      'title': title,
      'price': price ?? 0.0, // Default to 0.0 if null
      'originalPrice': originalPrice ?? 0.0, // Default to 0.0 if null
      'image': image,
      'quantity': 1,
    });
    notifyListeners();
  }

  void removeItem(dynamic id) {
    _items.removeWhere((item) => item['id'] == id);
    notifyListeners();
  }

  double get subtotal => _items.fold(
      0,
      (sum, item) =>
          sum + (item['price'] as double) * (item['quantity'] as int));

  double get originalTotal => _items.fold(
      0,
      (sum, item) =>
          sum + (item['originalPrice'] as double) * (item['quantity'] as int));

  double get discount => originalTotal - subtotal;

  double get shippingCost => _items.isNotEmpty ? 10.0 : 0.0;

  double get total => subtotal + shippingCost;
}
