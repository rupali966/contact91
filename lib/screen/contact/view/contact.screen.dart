import 'package:contactthree/screen/CustomButtonTest/view/custombutton.dart';
import 'package:contactthree/screen/home/view/home.screen.dart';
import 'package:contactthree/widget/component/widgets.dart';
import 'package:flutter/material.dart';

// data dat = dt;

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    int? i = 1;
    i = ModalRoute.of(context)!.settings.arguments as int?;
    // List<Contact> conta=[];
    // Future<void> contactkaro () async {
    //   List<Contact> contacts = await ContactsService.getContacts();
    //   conta = contacts;
    // }

    // CustomButtonTest c = CustomButtonTest(i);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Contact"),
          // leading: SizedBox(height: 20, width: 20, child: CustomButtonTest()),
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: drop((i == null) ? 1 : i),
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
                    child: profileimg(
                        rad: 70, bgimg: usrdt.contactimg[(i == null) ? 1 : i])),
              ),
              S(h: 10),
              Center(
                  child: Column(
                children: [
                  txt2(str: "Name"),
                  txt(str: usrdt.contactname[(i == null) ? 1 : i]),
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
                          S(h: 20),
                          viewcall2(
                            substr: "Number",
                            mainclr: Colors.blue,
                            mainstr: usrdt.contactnumber[(i == null) ? 1 : i],
                            mainTap: () {
                              dial(
                                  num:
                                      usrdt.contactnumber[(i == null) ? 1 : i]);
                            },
                            leading: Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      dial(
                                          num: usrdt.contactnumber[
                                              (i == null) ? 1 : i]);
                                    },
                                    icon: const Icon(Icons.call,
                                        color: Colors.green))
                              ],
                              ),
                            ),
                            viewcall2(
                                substr: "Address",
                              mainstr: usrdt.contactadrees[(i == null) ? 1 : i],
                              leading: const Icon(
                                Icons.location_city_rounded,
                                color: Colors.green,
                              )),
                          viewcall2(
                              substr: "Email",
                              mainstr: usrdt.contactemail[(i == null) ? 1 : i],
                              leading: IconButton(
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
