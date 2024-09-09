import 'package:weatherapp/screens/atm_card.dart';
import 'package:weatherapp/atm/card_wallet.dart';
import 'package:weatherapp/screens/dbscreen.dart';
import 'package:weatherapp/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/models/database1.dart';
import 'package:weatherapp/screens/weather.dart';
import 'package:weatherapp/screens/widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Wallet(),
      // home: RotateContainer(),
      // home: DBScreen(),
      home: CardScreen(),

    );
  }
}


