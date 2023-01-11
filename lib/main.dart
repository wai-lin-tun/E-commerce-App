

import 'package:ecommerce_app/screens/splash_screen/splash.dart';
import 'package:ecommerce_app/service/provider/profile_image_provider.dart';
import 'package:ecommerce_app/service/provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider<AllProvider>(create:(context)=> AllProvider()),
        ChangeNotifierProvider<ProfileProvider>(create:(context)=> ProfileProvider()),
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
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}