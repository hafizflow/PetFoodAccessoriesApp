import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:pet_food_accessories_app/providers/login_provider.dart';
import 'package:pet_food_accessories_app/routers/app_routers.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class RiveLoginPage extends StatelessWidget {
  const RiveLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: RiveAnimation.asset(
                  "assets/animated_login_character.riv",
                  stateMachines: const ["Login Machine"],
                  onInit: loginProvider.initializeRive,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  alignment: Alignment.center,
                  width: 400,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 10,
                        blurRadius: 10,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: Form(
                      key: loginProvider.formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: loginProvider.moveEyeBall,
                            onTap: loginProvider.isCheckField,
                            controller: loginProvider.usernameController,
                            style: const TextStyle(fontSize: 15),
                            cursorColor: Colors.teal,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.mail_rounded,
                                color: Colors.teal,
                              ),
                              hintText: "email",
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
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            onTap: loginProvider.hidePassword,
                            controller: loginProvider.passwordController,
                            obscureText: !loginProvider.isPasswordVisible,
                            style: const TextStyle(fontSize: 15),
                            cursorColor: Colors.teal,
                            textInputAction: TextInputAction.done,

                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Iconsax.lock,
                                color: Colors.teal,
                              ),
                              hintText: "Password",
                              hintStyle: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              suffixIcon: IconButton(
                                onPressed:
                                    loginProvider.togglePasswordVisibility,
                                icon:
                                    loginProvider.isPasswordVisible
                                        ? const Icon(Iconsax.eye)
                                        : const Icon(Iconsax.eye_slash),
                              ),
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
                                return "Please enter a valid password";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 25),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.teal,
                            ),
                            child: InkWell(
                              onTap: loginProvider.validateForm,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.quicksand(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.quicksand(
                      fontSize: 16,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed:
                        () => Navigator.pushNamed(context, AppRoutes.signup),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
