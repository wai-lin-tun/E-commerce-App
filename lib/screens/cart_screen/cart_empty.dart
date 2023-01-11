import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyConstant myConstant = MyConstant();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Lottie.asset(myConstant.emptyCartLottie),
        ),
        SizedBox(
          child: Column(
            children: [
              Text(
                "Your Cart is Empty",
                style: TextStyle(
                    color: myConstant.kDarkBlueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Look like you haven't added any courses \nto your cart yet.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: myConstant.cursorColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
