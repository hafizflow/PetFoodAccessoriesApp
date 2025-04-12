// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pet_food_accessories_app/model/product_model.dart';
// import 'package:pet_food_accessories_app/routers/app_routers.dart';
// import 'package:pet_food_accessories_app/widgets/appbar_text.dart';
// import 'package:pet_food_accessories_app/widgets/have_to_login.dart';
// import 'package:pet_food_accessories_app/widgets/prduct_card.dart';

// class WishListPage extends StatelessWidget {
//   const WishListPage({super.key});

//   final bool isEmpty = false;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(color: Colors.teal),
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text(
//               'Something went wrong',
//               style: GoogleFonts.quicksand(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.red[400],
//               ),
//             ),
//           );
//         } else if (snapshot.hasData) {
//           return Scaffold(
//             appBar: AppBar(
//               title: AppBarText(title: 'Wish List'),
//               centerTitle: true,
//               backgroundColor: Colors.transparent,
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 padding: const EdgeInsets.only(bottom: 16),
//                 itemCount: 8,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 24,
//                   mainAxisSpacing: 16,
//                   mainAxisExtent: 260,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   return InkWell(
//                     // child: ProductCard(product: product),
//                     onTap: () {
//                       Navigator.pushNamed(
//                         context,
//                         AppRoutes.productDetail,
//                         arguments: index,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           );
//         } else {
//           return HaveToLogin(text: ' to see your wish list');
//         }
//       },
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_food_accessories_app/model/product_model.dart';
import 'package:pet_food_accessories_app/routers/app_routers.dart';
import 'package:pet_food_accessories_app/widgets/appbar_text.dart';
import 'package:pet_food_accessories_app/widgets/have_to_login.dart';
import 'package:pet_food_accessories_app/widgets/prduct_card.dart';

class WishListPage extends StatelessWidget {
  WishListPage({super.key});

  // Sample demo products
  final List<Product> demoProducts = [
    Product(
      id: '1',
      name: 'FeatherFuel Bird Food',
      description: 'A healthy blend for small birds.',
      price: 5,
      category: 'bird food',
      imageUrl: [
        'https://github.com/hafizflow/PawMartAssets/blob/main/Assets/bird1.png?raw=true',
        'https://github.com/hafizflow/PawMartAssets/blob/main/Assets/bird2.png?raw=true',
      ],
      rating: 4.4,
      isFavorite: true,
    ),
    Product(
      id: '2',
      name: 'AquaBites Fish Food',
      description: 'Pellets for tropical fish.',
      price: 4,
      category: 'fish food',
      imageUrl: [
        'https://github.com/hafizflow/PawMartAssets/blob/main/Assets/fish1.png?raw=true',
        'https://github.com/hafizflow/PawMartAssets/blob/main/Assets/fish2.png?raw=true',
      ],
      rating: 4.3,
      isFavorite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.teal),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Something went wrong',
              style: GoogleFonts.quicksand(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.red[400],
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: AppBarText(title: 'Wish List'),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: demoProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 260,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final product = demoProducts[index];
                  return InkWell(
                    child: ProductCard(product: product),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.productDetail,
                        arguments: product,
                      );
                    },
                  );
                },
              ),
            ),
          );
        } else {
          return const HaveToLogin(text: ' to see your wish list');
        }
      },
    );
  }
}
