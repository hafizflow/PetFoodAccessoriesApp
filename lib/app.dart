import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/product_detail_page.dart';
import 'package:pet_food_accessories_app/providers/bottom_nav_provider.dart';
import 'package:pet_food_accessories_app/views/home_page.dart';
import 'package:pet_food_accessories_app/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

class PetFoodAccessoriesApp extends StatelessWidget {
  const PetFoodAccessoriesApp({super.key});

  static final List<Widget> pages = [
    const HomePage(),
    ProductDetailPage(),
    // const Center(child: Text('Favorites')),
    const Center(child: Text('Cart')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: bottomNavProvider.selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: HBottomNavBar(
        selectedIndex: bottomNavProvider.selectedIndex,
        onItemTapped: bottomNavProvider.updateIndex,
      ),
    );
  }
}
