import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Success animation
      trigSuccess?.change(true);

      // Optional: Navigate to home or login
      // Navigator.pushReplacementNamed(context, AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      print("Firebase SignUp Error: ${e.code} - ${e.message}");
      trigFail?.change(true);

      // Optional: Show snackbar
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? 'Signup failed')));
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
