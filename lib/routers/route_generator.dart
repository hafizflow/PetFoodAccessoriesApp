import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/views/home_page.dart';
import 'package:pet_food_accessories_app/views/login_page.dart';
import 'package:pet_food_accessories_app/views/product_detail_page.dart';
import 'package:pet_food_accessories_app/views/signup_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());

      case '/product_detail':
        return MaterialPageRoute(builder: (_) => const ProductDetailPage());

      case '/signup':
        return MaterialPageRoute(builder: (_) => const RiveSignUpPage());

      case '/login':
        return MaterialPageRoute(builder: (_) => const RiveLoginPage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(body: Center(child: Text("Page not found!"))),
    );
  }
}
