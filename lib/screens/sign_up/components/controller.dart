import 'package:ecommerce_app/screens/sign_up/components/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpController{
  snackBar(context) {
     final appLocalization =  AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: "Right",
          onPressed: () {},
        ),
        content:  Text(appLocalization!.yourAccountCreated),
        duration: const Duration(milliseconds: 1500),
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
   signUp(context,{
  required String name,
  required String email,
  required String password,
 }
  )async{
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
         auth.currentUser!.updateDisplayName(name);
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignUpSuccess()));
    }on FirebaseAuthException catch (e){
     if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
        return snackBar(context);
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
        return snackBar(context);
      }
    } catch (e) {
      // ignore: avoid_print
      print("Yes");
    }
  }
}