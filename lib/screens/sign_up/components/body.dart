import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/sign_up/components/signup_textfield.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyConstant myConstant = MyConstant();
    return Scaffold(
      body: SizedBox(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Positioned(
              child: Container(
                alignment: Alignment.topCenter,
                color: Colors.white,
                child: Lottie.asset(myConstant.signupLottie),
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
                    child: SignUpTextField()
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
