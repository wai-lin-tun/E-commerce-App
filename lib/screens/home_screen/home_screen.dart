import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/cart_screen/cart.dart';
import 'package:ecommerce_app/screens/home_screen/components/body.dart';
import 'package:ecommerce_app/screens/home_screen/components/bottom_navbar.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
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
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: -15, end: -12),
                onTap: () {
                  Get.to(() => const CartScreen());
                },
                badgeContent: Text(
                  value.productList.length.toString(),
                  style: TextStyle(color: myConstant.white),
                ),
                child:  Icon(
                  Icons.shopping_cart,
                  color: myConstant.kDarkBlueColor,
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.search_sharp,
            color: myConstant.kDarkBlueColor,
            size: 30,
          ),
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
