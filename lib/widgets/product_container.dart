import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/string.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
    this.height,
    this.width,
    required this.press,
    this.text,
    required this.imageUrl,
  }) : super(key: key);
  String? text;
  final String imageUrl;
  double? height;
  double? width;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    MyConstant myConstant = MyConstant();
    return GestureDetector(
      onTap: press,
      child: Container(
          height: height,
          width: width,
          color: myConstant.white,
          child: Center(
            child: SizedBox(
              height: 100,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: Lottie.asset(loadingLottie,height: 50,width: 50)),
                errorWidget: (context, url, error) => Image.network(
                    myConstant.placeholderUrl),
              ),
            ),
          )),
    );
  }
}
