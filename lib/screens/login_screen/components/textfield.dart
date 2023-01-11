import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/login_screen/components/controller.dart';
import 'package:ecommerce_app/screens/sign_up/signup_screen.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyConstant myConstant = MyConstant();
    LoginController loginController = LoginController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
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
            decoration: InputDecoration.collapsed(
              hintStyle: myConstant.textFieldHintTextStyle,
              hintText: "Email",
            ),
          ),
        ),
        Container(
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
            controller: loginController.passwardController,
            cursorColor: myConstant.cursorColor,
            decoration: InputDecoration.collapsed(
              hintStyle: myConstant.textFieldHintTextStyle,
              hintText: "Password",
            ),
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "ForgetPassword",
                style: TextStyle(color: myConstant.kDarkBlueColor),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            loginController.logIn(context);
             Provider.of<AllProvider>(context,listen: false).setPrefsItems();
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
