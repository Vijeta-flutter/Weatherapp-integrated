import 'package:weatherapp/atm_card.dart';
import 'package:weatherapp/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/screens/weather.dart';
import 'package:weatherapp/widget.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RotateContainer(),
    );
  }
}