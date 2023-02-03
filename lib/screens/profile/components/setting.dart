import 'package:ecommerce_app/l10n/l10n.dart';
import 'package:ecommerce_app/string.dart';
import 'package:ecommerce_app/widgets/language_widge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final appLocalization =  AppLocalizations.of(context);
    final locale = Localizations.localeOf(context);
     final flag = L10n.getFlag(locale.languageCode);
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalization!.settings),
        centerTitle: true,
       elevation: 0,
      ),
      body: Column(
      
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        ListTile(
          leading:const Icon(Icons.language,color: Colors.black) ,
          title: Text(appLocalization.language),
    trailing:const LanguagePicker(),
        )
        ],
      ),
    );
  }
}