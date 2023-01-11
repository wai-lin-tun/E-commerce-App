import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/favorite/favorite.dart';
import 'package:ecommerce_app/screens/home_page/home_page.dart';
import 'package:ecommerce_app/screens/message/message.dart';
import 'package:ecommerce_app/screens/profile/profile_screen.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  static const List<Widget> widgetList = <Widget>[
    HomePage(),
    FavoritePage(),
    MessagePage(),
    ProfileScreen()
  ];
  MyConstant myConstant = MyConstant();
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AllProvider>(
      builder: (context, value, child) {
        return Center(
          child: widgetList.elementAt(value.currentIndex),
        );
      },
    );
  }
}
