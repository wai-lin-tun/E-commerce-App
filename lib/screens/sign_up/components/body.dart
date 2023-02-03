import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/sign_up/components/signup_textfield.dart';
import 'package:ecommerce_app/string.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyConstant myConstant = MyConstant();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Positioned(
              child: Container(
                alignment: Alignment.topCenter,
                color: Colors.white,
                child: Lottie.asset(signupLottie),
              ),
            ),
            Positioned(
              top:size.height/3 ,
              width: size.width,
              height: size.height/2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 10,
                  child: Container(
                    color: Colors.white,
                    child:const Padding(
                      padding:  EdgeInsets.all(12.0),
                      child: SignUpTextField()
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
