
import 'package:contactthree/screen/contact/contactscreen.dart';
import 'package:contactthree/screen/home/view/homescreen.dart';
import 'package:flutter/material.dart';


void main() {


  runApp(
      MaterialApp(
        // initialRoute: 'contact',
        routes: {
          '/':(context) => const HomeScreen(),
          'contact':(context) => const ContactScreen(),
        },
      )
  );
}
