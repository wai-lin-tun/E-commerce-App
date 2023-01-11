import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/login_screen/login.dart';
import 'package:ecommerce_app/screens/sign_up/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  MyConstant  myConstant = MyConstant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: OnBoardingSlider(
          finishButtonText: "Register",
          onFinish: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
          finishButtonColor: myConstant.kDarkBlueColor,
          trailing: Text(
            'Login',
            style: TextStyle(
              fontSize: 16,
              color: myConstant.kDarkBlueColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailingFunction: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          skipTextButton: Text(
            'Skip',
            style: TextStyle(
              color: myConstant.kDarkBlueColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          controllerColor: myConstant.kDarkBlueColor,
          totalPage: 3,
          headerBackgroundColor: Colors.white,
          pageBackgroundColor: Colors.white,
          background: [
          Image.network(myConstant.imageUrl1,height: 300,),
          Image.network(myConstant.imageUrl2,height: 250,),
          Image.network(myConstant.imageUrl3,height: 250,)
          ],
          speed: 1.5,
          pageBodies: [
             Container(
          padding:const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            const  SizedBox(
                height: 480,
              ),
              Text(
                'On your way...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: myConstant.kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
             const SizedBox(
                height: 20,
              ),
             const Text(
                'to find the perfect looking Onboarding for your app?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             const SizedBox(
                height: 480,
              ),
              Text(
                'You’ve reached your destination.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: myConstant.kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
             const SizedBox(
                height: 20,
              ),
             const Text(
                'Sliding with animation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             const SizedBox(
                height: 480,
              ),
              Text(
                'Start now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: myConstant.kDarkBlueColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
             const SizedBox(
                height: 20,
              ),
             const Text(
                'Where everything is possible and customize your onboarding.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}