import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HCategory extends StatelessWidget {
  const HCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryItem(imagePath: 'assets/dog.png', label: 'Dog'),
            CategoryItem(imagePath: 'assets/cat.png', label: 'Cat'),
            CategoryItem(imagePath: 'assets/bird.png', label: 'Birds'),
            CategoryItem(imagePath: 'assets/fish.png', label: 'Fish'),
          ],
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryItem({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.teal.withAlpha(50),
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$label clicked')));
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey.withAlpha(50),
            child: Image.asset(
              imagePath,
              height: 38,
              fit: BoxFit.contain,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.quicksand(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
