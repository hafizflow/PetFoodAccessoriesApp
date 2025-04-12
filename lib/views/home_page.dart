import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/providers/product_provider.dart';
import 'package:pet_food_accessories_app/routers/app_routers.dart';
import 'package:pet_food_accessories_app/widgets/appbar.dart';
import 'package:pet_food_accessories_app/widgets/carousel.dart';
import 'package:pet_food_accessories_app/widgets/category.dart';
import 'package:pet_food_accessories_app/widgets/heading.dart';
import 'package:pet_food_accessories_app/widgets/prduct_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final bestSellers = productProvider.bestSellers;

    return Scaffold(
      appBar: HAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HHeading(title: 'Special Offers', isSeeAll: false),
              HCarousel(),
              HHeading(title: 'Categories', isSeeAll: false),
              const HCategory(),
              HHeading(
                title: 'Best Sellers',
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.allProducts);
                },
              ),
              bestSellers.isEmpty
                  ? const Center(
                    child: CircularProgressIndicator(color: Colors.teal),
                  )
                  : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: bestSellers.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 260,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      final product = bestSellers[index];
                      return InkWell(
                        child: ProductCard(product: product),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.productDetail,
                            arguments: product,
                          );
                        },
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
