import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:lookme/models/category.dart';
import 'package:lookme/models/product.dart';
import 'package:lookme/service/http_service.dart';

class DataProvider extends ChangeNotifier {
  HttpService service = HttpService();
  List<Category> _categories = [];
  List<Product> _products = [];
  bool _isLoading = false;
  int _currentPage = 1;
  final int _limit = 10; // Number of products per page
  bool _hasMore = true; // Flag for pagination

  List<Category> get categories => _categories;
  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchAllCategories() async {
    try {
      final response = await service.getItems(endpointUrl: "api/category/all");

      if (response?.statusCode == 200) {
        List data = response?.data;
        _categories = data.map((json) => Category.fromJson(json)).toList();
        notifyListeners(); // Notify UI to rebuild
      } else {
        throw Exception("Failed to load categories");
      }
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }

  Future<void> fetchProducts({bool loadMore = false}) async {
    if (_isLoading || (!_hasMore && loadMore)) return;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await service.getItems(
        endpointUrl: "api/products/",
        queryParameters: {
          "page": _currentPage,
          "limit": _limit,
        },
      );

      List<Product> fetchedProducts = (response?.data["products"] as List)
          .map((json) => Product.fromJson(json))
          .toList();

      if (fetchedProducts.length < _limit) {
        _hasMore = false; // No more products to load
      }

      if (loadMore) {
        _products.addAll(fetchedProducts);
        _currentPage++; // Increase page for next load
      } else {
        _products = fetchedProducts; // First load or refresh
        _currentPage = 2;
        _hasMore = true;
      }

      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching products: $e");
    }

    _isLoading = false;
  }
}
