import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  ThemeData themeData(bool isDarkTheme) => ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.red),
          bodyText2: TextStyle(color: Colors.red),
        ),
        primaryColor: isDarkTheme ? Colors.black : Colors.white,
        backgroundColor: isDarkTheme ? Colors.black : const Color(0xffF1F5FB),
        indicatorColor:
            isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
        hintColor: isDarkTheme ? Colors.black : const Color(0xffEECED3),
        highlightColor:
            isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
        hoverColor:
            isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
        focusColor:
            isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
        disabledColor: Colors.grey,
        cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 60,
          elevation: 5,
        ),
      );
}
