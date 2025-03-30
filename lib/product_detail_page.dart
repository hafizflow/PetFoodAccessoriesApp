import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/providers/product_detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductDetailProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
              ),
              height: MediaQuery.of(context).size.height * 0.45,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: PageView(
                      controller: productProvider.pageController,
                      onPageChanged: (index) => productProvider.setPage(index),
                      children:
                          productProvider.images
                              .map(
                                (image) =>
                                    Image.asset(image, fit: BoxFit.contain),
                              )
                              .toList(),
                    ),
                  ),
                  // Thumbnails Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        productProvider.images.asMap().entries.map((entry) {
                          int index = entry.key;
                          String image = entry.value;
                          return GestureDetector(
                            onTap: () => productProvider.setPage(index),
                            child: Container(
                              height: 60,
                              width: 55,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color:
                                      productProvider.currentPage == index
                                          ? Colors.teal
                                          : Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: Image.asset(image, fit: BoxFit.cover),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
            // Back Button
            Positioned(
              top: 10,
              left: 36,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: InkWell(
                  // onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // Share Button
            Positioned(
              top: 10,
              right: 36,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: InkWell(
                  onTap: () {
                    // Add share functionality
                  },
                  child: const Icon(
                    Icons.share_outlined,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // Heart Button
            Positioned(
              top: 10,
              right: 92,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: InkWell(
                  onTap: () {
                    // Add like functionality
                  },
                  child: const Icon(Iconsax.heart, size: 24, color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
