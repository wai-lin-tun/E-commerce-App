import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/login_screen/components/controller.dart';
import 'package:ecommerce_app/screens/sign_up/signup_screen.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:ecommerce_app/string.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({Key? key}) : super(key: key);

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  LoginController loginController = LoginController();
  MyConstant myConstant = MyConstant();
  @override
  Widget build(BuildContext context) {
    final appLocalization =  AppLocalizations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            controller: loginController.emailController,
            cursorColor: myConstant.cursorColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: myConstant.textFieldHintTextStyle,
              hintText: appLocalization!.email,
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
                obscureText: value.loginpasswordVisible,
                controller: loginController.passwardController,
                cursorColor: myConstant.cursorColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      value.loginVisible();
                    },
                    child: value.loginpasswordVisible
                        ? Icon(
                            Icons.visibility_off,
                            color: myConstant.kDarkBlueColor,
                          )
                        : Icon(
                            Icons.visibility,
                            color: myConstant.kDarkBlueColor,
                          ),
                  ),
                  hintStyle: myConstant.textFieldHintTextStyle,
                  hintText: appLocalization.passward,
                ),
              ),
            );
          },
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                appLocalization.forgetPassword,
                style: TextStyle(color: myConstant.kDarkBlueColor),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            loginController.logIn(context);
            Provider.of<AllProvider>(context, listen: false).setPrefsItems();
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: myConstant.kDarkBlueColor,
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
          child: Text(
            "Signup",
            style: TextStyle(color: myConstant.kDarkBlueColor),
          ),
        ),
      ],
    );
  }
}
