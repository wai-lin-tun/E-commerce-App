import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  MyConstant myConstant = MyConstant();
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SignUpBody()
    );
  }
}
