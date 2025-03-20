import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lookme/models/category.dart';
import 'package:lookme/models/product.dart';
import 'package:lookme/service/http_service.dart';

class DataProvider extends ChangeNotifier {
  HttpService service = HttpService();
  List<Category> _categories = [];
  List<Product> _products = [];
  bool _isLoading = false;
  int _currentPage = 1;
  final int _limit = 10;
  bool _hasMore = true;
  String _selectedCategory = "All";

  List<Category> get categories => _categories;
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String get selectedCategory => _selectedCategory;
  DataProvider() {
    fetchAllCategories();
    fetchProducts();
  }

  Future<void> fetchAllCategories() async {
    try {
      final response = await service.getItems(endpointUrl: "api/category/all");
      log("category ---> ${response?.data}");
      if (response?.statusCode == 200) {
        List data = response?.data;
        _categories = data.map((json) => Category.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception("Failed to load categories");
      }
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }

  Future<void> fetchProducts(
      {String category = "All", bool loadMore = false}) async {
    if (!loadMore) {
      _products.clear(); // ✅ Clear previous products when changing category
      _hasMore = true;
      _currentPage = 1;
    }

    if (!hasMore || isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await service.getItems(
        endpointUrl: 'api/products',
        queryParameters: {
          "category": category == "All" ? null : category,
          "page": _currentPage,
          "limit": _limit,
        },
      );

      List<Product> newProducts = (response?.data['products'] as List)
          .map((json) => Product.fromJson(json))
          .toList();

      if (newProducts.isEmpty) _hasMore = false;

      _products.addAll(newProducts);
      _currentPage++;
    } catch (error) {
      print("Error fetching products: $error");
    }

    _isLoading = false;
    notifyListeners();
  }
}
