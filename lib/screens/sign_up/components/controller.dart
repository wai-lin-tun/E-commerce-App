import 'package:ecommerce_app/screens/home_screen/home_screen.dart';
import 'package:ecommerce_app/screens/sign_up/components/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpController{
  snackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: "Right",
          onPressed: () {},
        ),
        content: const Text("Your account is created"),
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
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
         password:password,
         );
         auth.currentUser!.updateDisplayName(name);
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignUpSuccess()));
    }on FirebaseAuthException catch (e){
     if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return snackBar(context);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return snackBar(context);
      }
    } catch (e) {
      print("Yes");
    }
  }
}