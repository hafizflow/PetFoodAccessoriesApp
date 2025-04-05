import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:like_button/like_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.index});

  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child:
                      index == null
                          ? Image.asset("assets/hii.png", fit: BoxFit.cover)
                          : Hero(
                            tag: 'product$index',
                            child: Image.asset(
                              "assets/hii.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                ),
              ),

              Positioned(top: 8, right: 6, child: LikeButton(size: 24)),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        "NutriNosh Dog Food",
                        style: GoogleFonts.quicksand(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Iconsax.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "4.9",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Dog Food",
                  style: GoogleFonts.quicksand(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Text(
                  "\$30.00",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // const SizedBox(height: 8),
        ],
      ),
    );
  }
}
