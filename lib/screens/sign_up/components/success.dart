import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/home_screen/home_screen.dart';
import 'package:ecommerce_app/string.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SignUpSuccess extends StatefulWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  State<SignUpSuccess> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignUpSuccess> {
  MyConstant myConstant = MyConstant();
  @override
  Widget build(BuildContext context) {
    final appLocalization =  AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset(successLottie,repeat: false),
           GestureDetector(
          onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomePage()));
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: myConstant.kDarkBlueColor,
            ),
            child:  Text(
             appLocalization!.next,
              style:const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        ],
      ),
    );
  } 
}