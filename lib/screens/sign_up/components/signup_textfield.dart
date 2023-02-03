import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/login_screen/login.dart';
import 'package:ecommerce_app/screens/sign_up/components/controller.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpTextField extends StatelessWidget {
  const SignUpTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final appLocalization =  AppLocalizations.of(context);
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    MyConstant myConstant = MyConstant();
    SignUpController signUpController = SignUpController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 13,
          ),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 223, 222, 222),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
          ),
          child: TextFormField(
            controller: usernameController,
            cursorColor: myConstant.cursorColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: myConstant.textFieldHintTextStyle,
              hintText: appLocalization!.userName,
            ),
          ),
        ),
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 13,
          ),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 223, 222, 222),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
          ),
          child: TextFormField(
            controller: emailController,
            cursorColor: myConstant.cursorColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: myConstant.textFieldHintTextStyle,
              hintText: appLocalization.email,
            ),
          ),
        ),
        Consumer<AllProvider>(
          builder: (context, value, child) {
            return Container(
              height: 60,
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 13,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 223, 222, 222),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: TextFormField(
                controller: passwordController,
                cursorColor: myConstant.cursorColor,
                obscureText: value.loginpasswordVisible,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: myConstant.textFieldHintTextStyle,
                  hintText: appLocalization.passward,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      value.signupVisible();
                    },
                    child: value.signupPasswordVisible
                        ? Icon(
                            Icons.visibility_off,
                            color: myConstant.kDarkBlueColor,
                          )
                        : Icon(
                            Icons.visibility,
                            color: myConstant.kDarkBlueColor,
                          ),
                  ),
                ),
              ),
            );
          },
        ),
        GestureDetector(
          onTap: () {
            signUpController.signUp(context,
                name: usernameController.text,
                email: emailController.text,
                password: passwordController.text);
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
              appLocalization.signup,
              style:const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
          },
          child: Text(
            "Login",
            style: TextStyle(color: myConstant.kDarkBlueColor),
          ),
        ),
      ],
    );
  }
}
