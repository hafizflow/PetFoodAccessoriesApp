import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:pet_food_accessories_app/widgets/heading.dart';
import 'package:pet_food_accessories_app/widgets/profile_image_picker.dart';
import 'package:pet_food_accessories_app/widgets/scratcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            profileInformation(context),
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
                        style: GoogleFonts.quicksand(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      content: HScratcher(),
                      actions: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Flexible(
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
          ],
        ),
      ),
    );
  }

  Column profileInformation(BuildContext context) {
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
              width: MediaQuery.of(context).size.width - 240,
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
                      color: Colors.white,
                      height: 200,
                      child: Center(
                        child: Text(
                          'Change Address',
                          style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
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
                  // color: Colors.teal[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.teal, width: 1),
                ),
                child: Text(
                  'Change',
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
