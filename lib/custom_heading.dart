import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({super.key, required this.title, this.isSeeAll = true});
  final String title;
  final bool isSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        if (isSeeAll)
          TextButton(
            onPressed: () {
              // Perform action on tap
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('$title button clicked')));
            },
            child: Text(
              'See All',
              style: GoogleFonts.quicksand(
                fontSize: 14,
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
