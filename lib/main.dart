import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/constant.dart';
import 'package:pet_food_accessories_app/custom_appbar.dart';
import 'package:pet_food_accessories_app/custom_bottom_nav.dart';
import 'package:pet_food_accessories_app/custom_carousel.dart';
import 'package:pet_food_accessories_app/custom_category.dart';
import 'package:pet_food_accessories_app/custom_heading.dart';
import 'package:pet_food_accessories_app/model/nav_item_model.dart';
import 'package:rive/rive.dart';

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

class PetFoodAccessoriesApp extends StatefulWidget {
  const PetFoodAccessoriesApp({super.key});

  @override
  State<PetFoodAccessoriesApp> createState() => _PetFoodAccessoriesAppState();
}

class _PetFoodAccessoriesAppState extends State<PetFoodAccessoriesApp> {
  int selectedIndex = 0;

  void onNavItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              CustomHeading(title: 'Special Offers', isSeeAll: false),
              CustomCarousel(),
              CustomHeading(title: 'Categories'),
              const CustomCategorySection(),
              CustomHeading(title: 'Best Sellers'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FloatingBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onNavItemTapped,
      ),
    );
  }
}
