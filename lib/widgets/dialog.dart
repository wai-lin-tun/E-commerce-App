import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    MyConstant myConstant = MyConstant();
    return AlertDialog(
      title: Text(title),
      titleTextStyle: TextStyle(color: myConstant.kDarkBlueColor),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: cancel,
          child: Text(
            "Cancel",
            style: TextStyle(color: myConstant.kDarkBlueColor),
          ),
        ),
        TextButton(
          onPressed: comfirm,
          child: Text(
            "Ok",
            style: TextStyle(color: myConstant.kDarkBlueColor),
          ),
        ),
      ],
    );
  }
}
