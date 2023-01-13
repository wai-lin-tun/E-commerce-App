import 'dart:async';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/home_screen/home_screen.dart';
import 'package:ecommerce_app/screens/onborading_screen/onborading.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<AllProvider>(context,listen: false).getPrefsItems();
    Timer(
     const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Provider.of<AllProvider>(context).isLoading ? const MyHomePage()
        :const OnBoradingScreen(),
         ),
        ),
    );
    super.initState();
  }

  MyConstant  myConstant = MyConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [myConstant.blue, myConstant.bluedeep],
          ),
        ),
        child:const Center(
          child:Text("E-Commerce",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            letterSpacing: 1
            ),
          )
        ),
      ),
    );
  }
}
