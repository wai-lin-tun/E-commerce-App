import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   MyConstant myConstant = MyConstant();
  @override
  Widget build(BuildContext context) {
     final appLocalization =  AppLocalizations.of(context);
   return  Consumer<AllProvider>(builder: (context, value, child) {
     return BottomNavyBar(
        selectedIndex:value.currentIndex ,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
        Provider.of<AllProvider>(context,listen: false).onTapItem(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon:const Icon(Icons.home),
            title: Text(appLocalization!.home),
            activeColor:myConstant.kDarkBlueColor,
            inactiveColor: myConstant.inActiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon:const Icon(Icons.favorite),
            title: Text(appLocalization.favorite),
            activeColor: myConstant.kDarkBlueColor,
            inactiveColor: myConstant.inActiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon:const Icon(Icons.message),
            title: Text(
              appLocalization.message,
            ),
            activeColor:myConstant.kDarkBlueColor,
            inactiveColor: myConstant.inActiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon:const Icon(Icons.person),
            title: Text(appLocalization.profile),
            activeColor: myConstant.kDarkBlueColor,
            inactiveColor: myConstant.inActiveColor,
            textAlign: TextAlign.center,
          ),
        ],
      );
   });
  }
}