import 'dart:async';

import 'package:contactthree/screen/contact/view/contact.screen.dart';
import 'package:contactthree/screen/email/view/email.screen.dart';
import 'package:contactthree/screen/home/view/home.screen.dart';
import 'package:contactthree/screen/settings/view/setting.screen.dart';
import 'package:contactthree/widget/constant/literals.dart';
import 'package:flutter/material.dart';

import 'screen/test/view/test.home.screen.dart';

truefalsevalue truefalsevalu = truefalsevalue();

void main() {
  runApp(
    MainScreena(),
  );
}

class MainScreena extends StatefulWidget {
  const MainScreena({Key? key}) : super(key: key);

  @override
  State<MainScreena> createState() => _MainScreenaState();
}

class _MainScreenaState extends State<MainScreena> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {});
    });
    return MaterialApp(
      theme: style.themeData(truefalsevalu.getval()),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        'contact': (context) => const ContactScreen(),
        'setting': (context) => const SettingScreen(),
        'demo': (context) => const SharedPreferencesDemo(),
        'email': (context) => EmailScreen(),
      },
    );
  }
}
