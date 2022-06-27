import 'package:contactthree/main.dart';
import 'package:contactthree/widget/component/style.dart';
import 'package:contactthree/widget/component/widgets.dart';
import 'package:flutter/material.dart';

Styles style = Styles();

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  bool themcolor2 = true;

  Widget build(BuildContext context) => MaterialApp(
        theme: style.themeData(truefalsevalu.getval()),
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Settings"),
            ),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => setState(
                      () => (truefalsevalu.getval() == true)
                          ? truefalsevalu.setboolvalu(trfl: false)
                          : truefalsevalu.setboolvalu(trfl: true),
                    ),
                    child: viewcall(
                      clr: Colors.white,
                      maintxt: (truefalsevalu.getval() == true)
                          ? "Night-Mode"
                          : "Day-Mode",
                      infotxt: "Change theme",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
