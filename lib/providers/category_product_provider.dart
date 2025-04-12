import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_food_accessories_app/model/product_model.dart';

class CategoryProductProvider extends ChangeNotifier {
  final List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getProductsByCategory(String category) async {
    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse(
        'https://pet-food-server-yyee.vercel.app/api/products?category=$category',
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> productsJson = jsonData['products'];
        _products.clear(); // Clear old products
        _products.addAll(productsJson.map((json) => Product.fromJson(json)));
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
