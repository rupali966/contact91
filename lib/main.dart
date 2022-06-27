import 'dart:async';

import 'package:contactthree/screen/contact/view/contact.screen.dart';
import 'package:contactthree/screen/home/view/home.screen.dart';
import 'package:contactthree/screen/settings/view/setting.screen.dart';
import 'package:contactthree/widget/constant/literals.dart';
import 'package:flutter/material.dart';

truefalsevalue truefalsevalu = truefalsevalue();

void main() {
  runApp(MainScreena());
}

class MainScreena extends StatefulWidget {
  const MainScreena({Key? key}) : super(key: key);

  @override
  State<MainScreena> createState() => _MainScreenaState();
}

class _MainScreenaState extends State<MainScreena> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {});
    });
    return MaterialApp(
      theme: style.themeData(truefalsevalu.getval()),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        'contact': (context) => const ContactScreen(),
        'setting': (context) => const SettingScreen(),
      },
    );
  }
}
