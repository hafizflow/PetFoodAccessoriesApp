import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/views/checkout_page.dart';
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
        int productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => ProductDetailPage(productId: productId),
        );

      case '/signup':
        return MaterialPageRoute(builder: (_) => const RiveSignUpPage());

      case '/login':
        return MaterialPageRoute(builder: (_) => const RiveLoginPage());

      case '/checkout':
        return MaterialPageRoute(builder: (_) => const CheckoutPage());

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
