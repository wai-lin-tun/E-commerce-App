import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/string.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalization =  AppLocalizations.of(context);
    MyConstant myConstant = MyConstant();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Lottie.asset(emptyCartLottie),
        ),
        SizedBox(
          child: Column(
            children: [
              Text(
               appLocalization!.yourCartIsEmpty,
                style: TextStyle(
                    color: myConstant.kDarkBlueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                appLocalization.lookLikeYou,
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
