import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/login_screen/components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  MyConstant myConstant = MyConstant();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Positioned(
              child: Container(
                alignment: Alignment.topCenter,
                color: Colors.white,
                child: Lottie.asset(myConstant.loginLottie),
              ),
            ),
            Positioned(
              top: 300,
              left: 20,
              width: 350,
              height: 400,
              child: Card(
                elevation: 10,
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.white,
                  child:const Padding(
                    padding:  EdgeInsets.all(12.0),
                    child: LoginTextField()
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
