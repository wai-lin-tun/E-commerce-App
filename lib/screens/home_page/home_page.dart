import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/home_page/components/body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyConstant myConstant = MyConstant();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: HomePageBody()),
    );
  }
}