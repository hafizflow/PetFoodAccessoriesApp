import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pet_food_accessories_app/widgets/animated_button.dart';
import 'package:pet_food_accessories_app/widgets/cart_item.dart';
import 'package:pet_food_accessories_app/widgets/heading.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController promoCode = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HHeading(
                      title: 'Shipping Address',
                      isSeeAll: false,
                      titleFontSize: 22,
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Home',
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Savar, Dhaka, Bangladesh',
                        style: GoogleFonts.quicksand(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.teal[100],
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Text(
                          'CHANGE',
                          style: GoogleFonts.quicksand(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey[300], thickness: 1, height: 32),
                    HHeading(
                      title: 'Order List',
                      isSeeAll: false,
                      titleFontSize: 22,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      itemBuilder: (context, index) {
                        return CartItem(isCountVisible: false);
                      },
                      itemCount: 6,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 12);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: TextFormField(
                    controller: promoCode,
                    style: const TextStyle(fontSize: 15),
                    cursorColor: Colors.teal,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Iconsax.code_circle,
                        color: Colors.teal,
                      ),
                      hintText: "Enter promo code",
                      hintStyle: GoogleFonts.quicksand(
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusColor: Colors.teal,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a valid promo code";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: Colors.teal, width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Apply',
                            style: GoogleFonts.quicksand(
                              color: Colors.teal,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            HAnimatedButton(),
          ],
        ),
      ),
    );
  }
}
