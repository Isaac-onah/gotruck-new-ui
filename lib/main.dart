import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newtruck/intro_screen.dart';
import 'package:newtruck/models/cart_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const IntroScreen(),
    );
  }
}
