import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_food_accessories_app/model/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _bestSellers = [];

  List<Product> get bestSellers => _bestSellers;

  Future<void> fetchBestSellers() async {
    final url = Uri.parse(
      'https://pet-food-server-yyee.vercel.app/api/bestsell',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List productsJson = data['products'];
      _bestSellers =
          productsJson.map((json) => Product.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
