
import 'package:contactthree/screen/contact/view/contact.screen.dart';
import 'package:contactthree/screen/home/view/home.screen.dart';
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
