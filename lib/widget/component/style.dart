import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  ThemeData themeData(bool isDarkTheme) {
    final Color clr;
    if (isDarkTheme == true) {
      clr = Color(0xff212121);
    } else {
      clr = Colors.amber;
    }
    return ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: isDarkTheme ? Colors.amber.shade300 : Colors.black,
        ),
        bodyText2: TextStyle(
          color: isDarkTheme ? Colors.amber.shade300 : Colors.black,
        ),
      ),
      // buttonTheme: ButtonThemeData(
      //   buttonColor: isDarkTheme ? Colors.deepPurple: Colors.deepPurple,
      // ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepPurple,
        // foregroundColor: isDarkTheme ? Colors.amber.shade300 : Colors.white
      ),
      primarySwatch: isDarkTheme ? Colors.amber : Colors.deepPurple,
      primaryColor: isDarkTheme ? Color(0xff212121) : Colors.white,
      backgroundColor: isDarkTheme ? Color(0xff3C3C3C) : Colors.white,
      hintColor: isDarkTheme ? Colors.amber : Colors.black,
      // canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        toolbarHeight: 65,
        elevation: 5,
        // backgroundColor: !isDarkTheme ? Colors.amber : Color(0xff3C3C3C),
        foregroundColor: isDarkTheme ? Colors.amber : Colors.white,
      ),
    );
  }
}
