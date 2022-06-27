import 'dart:io';

import 'package:contactthree/data/userinfo.dart';
import 'package:contactthree/screen/home/controller/cntr.home.dart';
import 'package:contactthree/widget/component/widgets.dart';
import 'package:contactthree/widget/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

data usrdt = data();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController ctrname = TextEditingController();
  TextEditingController cntrnumber = TextEditingController();
  TextEditingController cntradress = TextEditingController();
  TextEditingController cntremail = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? image;
  XFile? image2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Contact List "),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: usrdt.contactname.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'contact', arguments: i);
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: ListTile(
                            leading: InkWell(
                              child: Container(
                                height: 70,
                                width: 70,
                                child: CircleAvatar(
                                  backgroundImage: FileImage(
                                    File(usrdt.contactimg[i]),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(usrdt.contactname[i]),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(usrdt.contactnumber[i]),
                                  Text(
                                    usrdt.contactemail[i],
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  // Text(contactadrees[i]),
                                ],
                              ),
                            ),
                            // trailing: Icon(Icons.more_vert),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      insetPadding: EdgeInsets.all(5),
                      alignment: Alignment.bottomCenter,
                      title: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Text('Add Contact',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              )),
                        ),
                      ),
                      content: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return SingleChildScrollView(
                            child: Container(
                              height: 450,
                              width: double.infinity,
                              child: Expanded(
                                child: Column(
                                  children: [
                                    // showimgprofile(image2,image),
                                    InkWell(
                                      onTap: () async {
                                        image = await pickimggalary() as XFile?;
                                        if (image != null) {
                                          setState(() {
                                            image2 = image;
                                          });
                                        }
                                      },
                                      child: image2 == null
                                          ? profileimg(rad: 50, bgclr: clrblu)
                                          : profileimg(
                                              rad: 50, bgimg: image2!.path),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    txtfild(cntr: ctrname, hintStr: "Name"),
                                    txtfild(
                                        cntr: cntrnumber, hintStr: "Number"),
                                    txtfild(
                                        cntr: cntradress, hintStr: "Adress"),
                                    txtfild(cntr: cntremail, hintStr: "Email"),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              usrdt.contactname.add(ctrname.text.toString());
                              usrdt.contactnumber
                                  .add(cntrnumber.text.toString());
                              usrdt.contactimg.add(image!.path);
                              usrdt.contactadrees
                                  .add(cntradress.text.toString());
                              usrdt.contactemail.add(cntremail.text.toString());
                            });
                            Navigator.pop(context);
                          },
                          child: Text("Ok"),
                        )
                      ],
                    );
                  });
            },
            child: const Icon(Icons.add),
          ),
        ),

    );
  }
}
