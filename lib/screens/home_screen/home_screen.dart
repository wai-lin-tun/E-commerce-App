import 'package:badges/badges.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/cart_screen/cart.dart';
import 'package:ecommerce_app/screens/home_screen/components/body.dart';
import 'package:ecommerce_app/screens/home_screen/components/bottom_navbar.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static String routeName = "/home";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyConstant myConstant = MyConstant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<AllProvider>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => const CartScreen());
                },
                child: Badge(
                  badgeColor: myConstant.kDarkBlueColor,
                  badgeContent: Text(
                    value.productList.length.toString(),
                    style: TextStyle(color: myConstant.white),
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: myConstant.circleColor,
                    child: Icon(
                      Icons.shopping_cart,
                      color: myConstant.kDarkBlueColor,
                      size: 23,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
              radius: 20,
              backgroundColor: myConstant.circleColor,
              child: Icon(
                Icons.search,
                color: myConstant.kDarkBlueColor,
                size: 26,
              )),
          const SizedBox(
            width: 10,
          )
        ],
        title: Text(
          "E-commerce",
          style: TextStyle(color: myConstant.kDarkBlueColor, fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: myConstant.white,
        centerTitle: false,
      ),
      body: const HomeBody(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
