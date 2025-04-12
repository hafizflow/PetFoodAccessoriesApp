import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_food_accessories_app/model/product_model.dart';

class ProductService {
  final Map<String, List<Product>> _cache = {};

  Future<List<Product>> getProductsByCategory(String category) async {
    final lowerCategory = category.toLowerCase();

    if (_cache.containsKey(lowerCategory)) {
      return _cache[lowerCategory]!; // Return cached data
    }

    final url = Uri.parse(
      'https://pet-food-server-yyee.vercel.app/api/products?category=$lowerCategory',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> productsJson = jsonData['products'];
      final products =
          productsJson.map((json) => Product.fromJson(json)).toList();

      _cache[lowerCategory] = products; // Save to cache
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
