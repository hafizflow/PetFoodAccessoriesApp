import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/routers/app_routers.dart';
import 'package:pet_food_accessories_app/widgets/appbar_text.dart';
import 'package:pet_food_accessories_app/widgets/prduct_card.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(title: 'Wish List'),
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
            // childAspectRatio: 150 / 220,
            crossAxisSpacing: 24,
            mainAxisSpacing: 16,
            mainAxisExtent: 260,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: ProductCard(),
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