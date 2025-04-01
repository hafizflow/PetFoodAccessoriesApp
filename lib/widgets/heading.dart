import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HHeading extends StatelessWidget {
  const HHeading({
    super.key,
    required this.title,
    this.isSeeAll = true,
    this.titleFontSize = 24,
  });
  final String title;
  final bool isSeeAll;
  final double titleFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: GoogleFonts.quicksand(
            fontSize: titleFontSize,
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
