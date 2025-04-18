import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarText extends StatelessWidget {
  const AppBarText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }
}
