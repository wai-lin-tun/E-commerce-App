import 'package:ecommerce_app/screens/login_screen/components/success.dart';
import 'package:ecommerce_app/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();
  snackBar(context) {
     final appLocalization =  AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: appLocalization!.ok,
          onPressed: () {},
        ),
        content:  Text(appLocalization.emailAndPasswordIsWrong),
        duration: const Duration(seconds: 2),
        width: 280.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  logIn(context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwardController.text);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginSuccess(),
          ),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user found for that email.");
        return snackBar(context);
      } else if (e.code == 'wrong-password') {
        print("Wrong password provided for that user.");
        return snackBar(context);
      }
    }
  }
}
