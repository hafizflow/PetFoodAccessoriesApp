import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_food_accessories_app/model/product_model.dart';

class AllProductProvider with ChangeNotifier {
  List<Product> _allProducts = [];
  List<Product> get allProducts => _allProducts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<List<Product>> getAllProducts() async {
    final url = Uri.parse(
      'https://pet-food-server-yyee.vercel.app/api/products',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> productsJson = jsonData['products'];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load all products');
    }
  }

  /// Fetch all products from the API
  Future<void> fetchAllProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _allProducts = await getAllProducts();
    } catch (e) {
      debugPrint('Error fetching all products: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
