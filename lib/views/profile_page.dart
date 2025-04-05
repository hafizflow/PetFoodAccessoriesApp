import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:pet_food_accessories_app/routers/app_routers.dart';
import 'package:pet_food_accessories_app/widgets/heading.dart';
import 'package:pet_food_accessories_app/widgets/profile_image_picker.dart';
import 'package:pet_food_accessories_app/widgets/scratcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController address = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: ListView(
          children: [
            ProfileImagePicker(),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Change Your Profile Picture',
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 40),
            HHeading(
              title: 'Profile Information',
              isSeeAll: false,
              titleFontSize: 20,
            ),
            SizedBox(height: 18),
            profileInformation(context, address),
            Divider(color: Colors.grey[300], thickness: 1, height: 50),
            HHeading(
              title: 'Other Information',
              isSeeAll: false,
              titleFontSize: 20,
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Iconsax.code_1_copy),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              title: Text(
                'Promo Code',
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        'Promo Code',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      content: HScratcher(),

                      actions: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Done',
                                  style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Iconsax.logout_copy),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              title: Text(
                'Logout',
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: () {
                PanaraConfirmDialog.show(
                  context,
                  title: "Are you sure?",
                  message: "Do you want to logout?",
                  confirmButtonText: "Logout",
                  cancelButtonText: "Cancel",
                  onTapCancel: () => Navigator.pop(context),
                  onTapConfirm: () => Navigator.pop(context),
                  panaraDialogType: PanaraDialogType.error,
                );
              },
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Iconsax.login_copy),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              tileColor: Colors.red[100],
              title: Text(
                'Login',
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }

  Column profileInformation(
    BuildContext context,
    TextEditingController address,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 12,
      children: [
        Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(
                'Name:',
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Hafizur Rahman',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(
                'Email:',
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Expanded(
              child: Text(
                'rahman15-5678@diu.edu.bd',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 80,
              child: Text(
                'Address:',
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                'Savar, Dhaka, Bangladesh',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.quicksand(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      height: 230,
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HHeading(
                              title: 'Change Address',
                              isSeeAll: false,
                              titleFontSize: 20,
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: address,
                              style: const TextStyle(fontSize: 15),
                              cursorColor: Colors.teal,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Iconsax.safe_home,
                                  color: Colors.teal,
                                ),
                                hintText: "Enter your delivery address",
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
                                  borderSide: const BorderSide(
                                    color: Colors.teal,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter a valid address";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Flexible(
                                  child: InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(32),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Cancel',
                                            style: GoogleFonts.quicksand(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 24),
                                Flexible(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Address changed successfully',
                                            style: GoogleFonts.quicksand(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          duration: const Duration(seconds: 2),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Save',
                                            style: GoogleFonts.quicksand(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
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
          ],
        ),
      ],
    );
  }
}
