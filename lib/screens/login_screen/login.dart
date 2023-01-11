import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/login_screen/components/body.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  MyConstant myConstant = MyConstant();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody()    );
  }
}
