import 'package:flutter/material.dart';
import 'package:pet_food_accessories_app/widgets/toast.dart';
import 'package:rive/rive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toastification/toastification.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

  Future<bool> signInWithEmail(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      trigFail?.change(true);
      return false;
    }

    try {
      isChecking?.change(true);
      isHandsUp?.change(false);
      trigSuccess?.change(false);
      trigFail?.change(false);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      trigSuccess?.change(true);
      showToast(
        context,
        "Login",
        'Login Successful',
        ToastificationType.success,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      print("Login error: ${e.code} - ${e.message}");

      trigFail?.change(true);

      // Pass the error reason to the showToast method
      String errorMessage = e.message ?? 'Login failed';

      showToast(
        context,
        "Login Failed",
        errorMessage,
        ToastificationType.error,
      );

      return false;
    } finally {
      isChecking?.change(false);
      isHandsUp?.change(false);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
