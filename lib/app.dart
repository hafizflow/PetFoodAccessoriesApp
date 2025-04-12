import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/providers/bottom_nav_provider.dart';
import 'package:pet_food_accessories_app/providers/category_product_provider.dart';
import 'package:pet_food_accessories_app/providers/product_provider.dart';
import 'package:pet_food_accessories_app/views/cart_page.dart';
import 'package:pet_food_accessories_app/views/home_page.dart';
import 'package:pet_food_accessories_app/views/pet_shop_location.dart';
import 'package:pet_food_accessories_app/views/profile_page.dart';
import 'package:pet_food_accessories_app/views/wish_list_page.dart';
import 'package:pet_food_accessories_app/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

class PetFoodAccessoriesApp extends StatefulWidget {
  const PetFoodAccessoriesApp({super.key});

  static final List<Widget> pages = [
    const HomePage(),
    WishListPage(),
    PetShopLocation(),
    CartPage(),
    ProfilePage(),
    // RiveLoginPage(),
  ];

  @override
  State<PetFoodAccessoriesApp> createState() => _PetFoodAccessoriesAppState();
}

class _PetFoodAccessoriesAppState extends State<PetFoodAccessoriesApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchBestSellers();
    Provider.of<CategoryProductProvider>(
      context,
      listen: false,
    ).getProductsByCategory;
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: bottomNavProvider.selectedIndex,
        children: PetFoodAccessoriesApp.pages,
      ),
      bottomNavigationBar: HBottomNavBar(
        selectedIndex: bottomNavProvider.selectedIndex,
        onItemTapped: bottomNavProvider.updateIndex,
      ),
    );
  }
}
