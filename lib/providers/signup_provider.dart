// import 'package:flutter/material.dart';
// import 'package:pet_food_accessories_app/services/auth_services.dart';
// import 'package:rive/rive.dart';
// import 'package:toastification/toastification.dart';
// import 'package:pet_food_accessories_app/routers/app_routers.dart';
// import 'package:pet_food_accessories_app/widgets/toast.dart';

// class SignUpProvider extends ChangeNotifier {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   final AuthService _authService = AuthService();

//   SMIInput<bool>? isChecking;
//   SMIInput<bool>? isHandsUp;
//   SMIInput<bool>? trigSuccess;
//   SMIInput<bool>? trigFail;
//   SMINumber? numLook;
//   StateMachineController? stateMachineController;

//   bool isPasswordVisible = false;

//   void initializeRive(Artboard artBoard) {
//     stateMachineController = StateMachineController.fromArtboard(
//       artBoard,
//       "Login Machine",
//     );
//     if (stateMachineController == null) return;
//     artBoard.addController(stateMachineController!);

//     isChecking = stateMachineController?.findInput("isChecking");
//     isHandsUp = stateMachineController?.findInput("isHandsUp");
//     trigSuccess = stateMachineController?.findInput("trigSuccess");
//     trigFail = stateMachineController?.findInput("trigFail");
//     numLook = stateMachineController?.findSMI("numLook");
//   }

//   void isCheckField() {
//     isHandsUp?.change(false);
//     isChecking?.change(true);
//     numLook?.change(0);
//   }

//   void moveEyeBall(String val) {
//     numLook?.change(val.length.toDouble());
//   }

//   void hidePassword() {
//     isPasswordVisible ? isChecking?.change(true) : isHandsUp?.change(true);
//   }

//   void togglePasswordVisibility() {
//     isPasswordVisible = !isPasswordVisible;

//     if (isPasswordVisible) {
//       isChecking?.change(true);
//       isHandsUp?.change(false);
//     } else {
//       isChecking?.change(false);
//       isHandsUp?.change(true);
//     }

//     notifyListeners();
//   }

//   Future<void> signUpWithEmail(BuildContext context) async {
//     if (!formKey.currentState!.validate()) {
//       trigFail?.change(true);
//       return;
//     }

//     try {
//       isChecking?.change(true);
//       isHandsUp?.change(false);
//       trigSuccess?.change(false);
//       trigFail?.change(false);

//       await _authService.signup(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//         username: usernameController.text.trim(),
//       );

//       trigSuccess?.change(true);

//       showToast(
//         context,
//         "Signup Successful",
//         'Congratulations! You have successfully signed up.',
//         ToastificationType.success,
//       );

//       await Future.delayed(const Duration(seconds: 1));

//       Navigator.pushNamedAndRemoveUntil(
//         context,
//         AppRoutes.home,
//         (route) => false,
//       );

//       emailController.clear();
//       passwordController.clear();
//       usernameController.clear();
//     } catch (e) {
//       showToast(
//         context,
//         "Signup Failed",
//         e.toString(),
//         ToastificationType.error,
//       );
//       trigFail?.change(true);
//     } finally {
//       isChecking?.change(false);
//       isHandsUp?.change(false);
//     }
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/routers/app_routers.dart';
import 'package:pet_food_accessories_app/widgets/toast.dart';
import 'package:rive/rive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toastification/toastification.dart';

class SignUpProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;
  SMINumber? numLook;
  StateMachineController? stateMachineController;

  bool isPasswordVisible = false;

  void initializeRive(Artboard artBoard) {
    stateMachineController = StateMachineController.fromArtboard(
      artBoard,
      "Login Machine",
    );
    if (stateMachineController == null) return;
    artBoard.addController(stateMachineController!);

    isChecking = stateMachineController?.findInput("isChecking");
    isHandsUp = stateMachineController?.findInput("isHandsUp");
    trigSuccess = stateMachineController?.findInput("trigSuccess");
    trigFail = stateMachineController?.findInput("trigFail");
    numLook = stateMachineController?.findSMI("numLook");
  }

  void isCheckField() {
    isHandsUp?.change(false);
    isChecking?.change(true);
    numLook?.change(0);
  }

  void moveEyeBall(String val) {
    numLook?.change(val.length.toDouble());
  }

  void hidePassword() {
    isPasswordVisible ? isChecking?.change(true) : isHandsUp?.change(true);
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;

    if (isPasswordVisible) {
      isChecking?.change(true);
      isHandsUp?.change(false);
    } else {
      isChecking?.change(false);
      isHandsUp?.change(true);
    }

    notifyListeners();
  }

  Future<void> signUpWithEmail(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      trigFail?.change(true);
      return;
    }

    try {
      isChecking?.change(true);
      isHandsUp?.change(false);
      trigSuccess?.change(false);
      trigFail?.change(false);

      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      // Save additional user info to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
            'uid': credential.user!.uid,
            'email': emailController.text.trim(),
            'username': usernameController.text.trim(),
            'address': '',
            'profileImage': '',
            'createdAt': FieldValue.serverTimestamp(),
          });

      // Trigger success animation
      trigSuccess?.change(true);

      showToast(
        context,
        "Signup Successful",
        'Congratulations! You have successfully signed up.',
        ToastificationType.success,
      );

      // Optionally delay and navigate
      await Future.delayed(const Duration(seconds: 1));

      // Then navigate to home
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );

      emailController.clear();
      passwordController.clear();
      usernameController.clear();
    } on FirebaseAuthException catch (e) {
      print("Firebase SignUp Error: ${e.code} - ${e.message}");
      showToast(
        context,
        "Signup Failed",
        e.message ?? 'Signup failed',
        ToastificationType.error,
      );
      trigFail?.change(true);
    } finally {
      isChecking?.change(false);
      isHandsUp?.change(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
