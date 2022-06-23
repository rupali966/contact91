import 'dart:async';

import 'package:contactthree/data/userinfo.dart';
import 'package:contactthree/screen/CustomButtonTest/view/custombutton.dart';
import 'package:contactthree/screen/contact/controller/cntr.contact.dart';
import 'package:contactthree/widget/component/widgets.dart';
import 'package:flutter/material.dart';

late data dt;

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    data dat = ModalRoute.of(context)!.settings.arguments as data;
    int i = dat.num;
    dt = dat;
    CustomButtonTest c = CustomButtonTest(i);
    Timer.periodic(Duration(milliseconds: 100), (timer) { setState((){});});

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Contact"),
          // leading: SizedBox(height: 20, width: 20, child: CustomButtonTest()),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                child: CustomButtonTest(i),
                onTap: () {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              S(h: 50),
              Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: profileimg(rad: 70, bgimg: dt.contactimg[i])),
              ),
              S(h: 10),
              Center(
                  child: Column(
                children: [
                  txt2(str: "Name"),
                  txt(str: dt.contactname[i]),
                ],
              )),
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          viewcall2(
                            substr: "Number",
                            mainclr: Colors.blue,
                            mainstr: dt.contactnumber[i],
                            mainTap: () {
                              dial(num: dt.contactname[i]);
                            },
                            trailing: Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      dial(num: dt.contactname[i]);
                                    },
                                    icon: const Icon(Icons.call,
                                        color: Colors.green))
                              ],
                            ),
                          ),
                          viewcall2(
                            substr: "Address",
                            mainstr: dt.contactadrees[i],
                            trailing: sharebtn(i),
                          ),
                          viewcall2(
                              substr: "Email",
                              mainstr: dt.contactemail[i],
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.alternate_email_rounded,
                                      color: Colors.redAccent))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
