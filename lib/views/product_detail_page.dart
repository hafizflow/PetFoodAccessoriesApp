import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_food_accessories_app/providers/product_detail_provider.dart';
import 'package:provider/provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductDetailProvider>(context);

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Price',
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '\$30.00',
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Flexible(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.shopping_cart,
                        color: Colors.white,
                        size: 22,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Add to Cart',
                        style: GoogleFonts.quicksand(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
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
                            onPageChanged:
                                (index) => productProvider.setPage(index),
                            children:
                                productProvider.images
                                    .map(
                                      (image) => Image.asset(
                                        image,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                    .toList(),
                          ),
                        ),
                        // Thumbnails Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              productProvider.images.asMap().entries.map((
                                entry,
                              ) {
                                int index = entry.key;
                                String image = entry.value;
                                return GestureDetector(
                                  onTap: () => productProvider.setPage(index),
                                  child: Container(
                                    height: 60,
                                    width: 55,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
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
                                    child: Image.asset(
                                      image,
                                      fit: BoxFit.cover,
                                    ),
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
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,

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
                        child: const Icon(
                          Iconsax.heart,
                          size: 24,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //! Product Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Dog Food',
                        style: GoogleFonts.quicksand(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Icon(Iconsax.star, color: Colors.amber[600], size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '4.9',
                        style: GoogleFonts.quicksand(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  Text(
                    'Natural Dog Food',
                    style: GoogleFonts.quicksand(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 24),
                  Text(
                    'Product Details',
                    style: GoogleFonts.quicksand(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                    'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
