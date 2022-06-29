// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> setvalur;
  String hello = "";

  TextEditingController gettext = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future<String> funtiona() async {
      var prefs = await SharedPreferences.getInstance();
      prefs = await SharedPreferences.getInstance();
      return prefs.getString("username") as String;
    }

    hello = funtiona().toString() as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: gettext,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    saveStringValue(String str) async {
                      var prefs = await SharedPreferences.getInstance();
                      prefs = await SharedPreferences.getInstance();
                      prefs.setString("username", str);
                      hello = prefs.getString("username") as String;
                    }

                    saveStringValue(gettext.text.toString());
                    setState(() {});
                  },
                  child: Text("Save"))),
          Text(hello),
        ],
      ),
    );
  }
}
