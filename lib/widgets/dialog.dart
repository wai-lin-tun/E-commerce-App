import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({
    Key? key,
    required this.title,
    required this.cancel,
    required this.comfirm,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;
  final GestureTapCallback cancel;
  final GestureTapCallback comfirm;
  @override
  Widget build(BuildContext context) {
    final appLocalization =  AppLocalizations.of(context);
    MyConstant myConstant = MyConstant();
    return AlertDialog(
      title: Text(title),
      titleTextStyle: TextStyle(color: myConstant.kDarkBlueColor),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: cancel,
          child: Text(appLocalization!.cancel1,
           
            style: TextStyle(color: myConstant.kDarkBlueColor),
          ),
        ),
        TextButton(
          onPressed: comfirm,
          child: Text(
            appLocalization.ok,
            style: TextStyle(color: myConstant.kDarkBlueColor),
          ),
        ),
      ],
    );
  }
}
