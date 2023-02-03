

import 'package:ecommerce_app/l10n/l10n.dart';
import 'package:ecommerce_app/screens/splash_screen/splash.dart';
import 'package:ecommerce_app/service/provider/locale_provider.dart';
import 'package:ecommerce_app/service/provider/profile_image_provider.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  //   SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider<AllProvider>(create:(context)=> AllProvider()),
        ChangeNotifierProvider<ProfileProvider>(create:(context)=> ProfileProvider()),
        ChangeNotifierProvider<LocaleProvider>(create:(context)=> LocaleProvider()),
      ],
      child:const MyApp()
    ),);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    @override
  void initState() {
    context.read<AllProvider>().getCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final  provider = Provider.of<LocaleProvider>(context);
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
       locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates:const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
      home:const SplashScreen(),
    );
  }
}