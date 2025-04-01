import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_food_accessories_app/routers/app_routers.dart';
import 'package:pet_food_accessories_app/widgets/prduct_card.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wish List',
          style: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 16),
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width * 0.40 / 250,
            crossAxisSpacing: 24,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: const ProductCard(),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.productDetail);
              },
            );
          },
        ),
      ),
    );
  }
}



// Center(
//         child: Text(
//           'Your Wish List is Empty',
//           style: GoogleFonts.quicksand(fontSize: 20, color: Colors.grey[700]),
//         ),
//       ),