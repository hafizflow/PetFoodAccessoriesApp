import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/routers/app_routers.dart';
import 'package:pet_food_accessories_app/widgets/appbar.dart';
import 'package:pet_food_accessories_app/widgets/carousel.dart';
import 'package:pet_food_accessories_app/widgets/category.dart';
import 'package:pet_food_accessories_app/widgets/heading.dart';
import 'package:pet_food_accessories_app/widgets/prduct_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              HHeading(title: 'Special Offers', isSeeAll: false),
              HCarousel(),
              HHeading(title: 'Categories', isSeeAll: false),
              const HCategory(),
              HHeading(title: 'Best Sellers'),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 260,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: ProductCard(index: index),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.productDetail,
                        arguments: index,
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
