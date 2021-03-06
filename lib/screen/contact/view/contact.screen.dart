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
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                S(h: 50),
                Center(
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(),
                      child: profileimg(
                          rad: 70,
                          bgimg: usrdt.contactimg[(i == null) ? 1 : i]
                              .toString())),
                ),
                S(h: 10),
                Center(
                    child: Column(
                  children: [
                    txt2(str: "Name"),
                    txt(str: usrdt.contactname[(i == null) ? 1 : i]),
                  ],
                )),
                S(h: 20),
                Divider(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              dial(
                                num: usrdt.contactnumber[(i == null) ? 1 : i],
                              );
                            },
                            icon:
                                Icon(Icons.call, color: Colors.green, size: 30),
                          ),
                          txt(str: "Call", size: 10, color: Colors.green),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              msg(
                                num: usrdt.contactnumber[(i == null) ? 1 : i],
                              );
                            },
                            icon: Icon(
                              Icons.textsms,
                              size: 30,
                              color: Colors.orangeAccent,
                            ),
                          ),
                          txt(
                              str: "Text",
                              size: 10,
                              color: Colors.orangeAccent),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              SnackBar snackbar = SnackBar(
                                content: Text("Under Constrution .."),
                                backgroundColor: Colors.redAccent,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                              // video(num: usrdt.contactnumber[(i == null) ? 1 : i],);
                            },
                            icon: Icon(
                              Icons.video_camera_front,
                              size: 30,
                              color: Colors.blue,
                            ),
                          ),
                          txt(str: "Video", size: 10, color: Colors.blue),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'email',
                                  arguments:
                                      usrdt.contactemail[(i == null) ? 1 : i]);
                            },
                            icon: Icon(
                              Icons.mail,
                              size: 30,
                              color: Colors.redAccent,
                            ),
                          ),
                          txt(str: "Email", size: 10, color: Colors.redAccent),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
                Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Container(
                      // color: Colors.white,
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            S(h: 20),
                            viewcall3(
                              substr: txt(
                                str: usrdt.contactnumber[(i == null) ? 1 : i],
                                size: 13,
                                color: Colors.blue,
                              ),
                              mainstr: txt2(
                                str: "Number",
                              ),
                              mainTap: () {
                                dial(
                                  num: usrdt.contactnumber[(i == null) ? 1 : i],
                                );
                              },
                              lendinga: Column(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      dial(
                                        num: usrdt
                                            .contactnumber[(i == null) ? 1 : i],
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.call,
                                      color: Colors.green,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            viewcall3(
                              mainstr: txt2(
                                str: "Address",
                              ),
                              substr: txt(
                                str: usrdt.contactadrees[(i == null) ? 1 : i],
                                size: 13,
                              ),
                              lendinga: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.location_city,
                                    color: Colors.green,
                                  )),
                            ),
                            viewcall3(
                              mainstr: txt2(
                                str: "Email",
                              ),
                              substr: txt(
                                str: usrdt.contactemail[(i == null) ? 1 : i],
                                size: 13,
                              ),
                              lendinga: IconButton(
                                onPressed: () {
                                  emailto(
                                    email:
                                        usrdt.contactemail[(i == null) ? 1 : i],
                                    subject: "Scaibu",
                                  );
                                  // Navigator.pushNamed(context, 'email',arguments: usrdt.contactemail[(i == null) ? 1 : i]);
                                },
                                icon: const Icon(
                                  Icons.alternate_email_rounded,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
