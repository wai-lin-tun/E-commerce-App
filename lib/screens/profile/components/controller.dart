import 'package:ecommerce_app/screens/login_screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileController {
  FirebaseAuth auth = FirebaseAuth.instance;
  logOut(context) async {
    await auth.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
        (route) => false);
  }
}
