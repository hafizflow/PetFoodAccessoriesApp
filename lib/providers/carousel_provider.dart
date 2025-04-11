import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarouselProvider with ChangeNotifier {
  List<String> _imageUrls = [];
  bool _isLoading = false;
  String? _error;

  List<String> get imageUrls => _imageUrls;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchCarouselImages() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://pet-food-server-yyee.vercel.app/api/carousel'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> carouselItems = data['carosel'];
        _imageUrls =
            carouselItems.map((item) => item['url'].toString()).toList();
      } else {
        _error = 'Failed to load carousel';
      }
    } catch (e) {
      _error = 'Something went wrong: $e';
    }

    _isLoading = false;
    notifyListeners();
  }
}
