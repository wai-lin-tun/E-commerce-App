import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en',),
    const Locale('my',),
  ];
  static  String getName(String code){
  switch (code){
    case 'my':
    return 'Bamar';
    default :
    return 'English';
  }
  }
  static String getFlag(String code) {
    switch (code) {
      case 'my':
       return '🇲🇲';
      default :
        return '🇺🇸';
    }
  }
}
