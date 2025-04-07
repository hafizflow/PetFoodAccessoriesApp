import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_food_accessories_app/routers/app_routers.dart';
import 'package:pet_food_accessories_app/widgets/appbar_text.dart';
import 'package:pet_food_accessories_app/widgets/cart_item.dart';
import 'package:pet_food_accessories_app/widgets/my_custom_button.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> cartItems = List.generate(8, (index) => "Item ${index + 1}");

    return Scaffold(
      appBar: AppBar(
        title: AppBarText(title: 'My Cart'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.only(right: 30),
                child: Icon(Icons.delete_outline, color: Colors.white),
              ),
              key: Key(cartItems[index]),
              child: const CartItem(),
            );
          },
          itemCount: 8,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 12);
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.09,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      '\$300.00',
                      style: GoogleFonts.quicksand(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              MyCustomButton(
                text: 'Proceed to Checkout',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.checkout);
                },
              ),
              // Flexible(
              //   child: InkWell(
              //     onTap: () => Navigator.pushNamed(context, AppRoutes.checkout),
              //     child: Container(
              //       padding: const EdgeInsets.symmetric(vertical: 16),
              //       decoration: BoxDecoration(
              //         color: Colors.teal,
              //         borderRadius: BorderRadius.circular(32),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             'Proceed to Checkout',
              //             style: GoogleFonts.quicksand(
              //               color: Colors.white,
              //               fontSize: 18,
              //               fontWeight: FontWeight.w600,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
