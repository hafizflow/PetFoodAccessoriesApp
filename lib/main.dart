import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/app.dart';
import 'package:pet_food_accessories_app/providers/bottom_nav_provider.dart';
import 'package:pet_food_accessories_app/providers/product_detail_provider.dart';
import 'package:pet_food_accessories_app/routers/route_generator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => ProductDetailProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Food & Accessories App',
      home: const PetFoodAccessoriesApp(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
