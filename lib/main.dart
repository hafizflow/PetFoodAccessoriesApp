import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/custom_appbar.dart';
import 'package:pet_food_accessories_app/custom_carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Food & Accessories App',
      home: const PetFoodAccessoriesApp(),
    );
  }
}

class PetFoodAccessoriesApp extends StatelessWidget {
  const PetFoodAccessoriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 16),
          CustomCarousel(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
