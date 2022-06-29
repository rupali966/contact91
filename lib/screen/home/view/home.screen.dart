import 'package:contactthree/data/userinfo.dart';
import 'package:contactthree/main.dart';
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
  String number = "Acceding";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contact List "),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'demo');
              },
              icon: Icon(
                Icons.more_vert,
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: usrdt.contactname.length,
                  itemBuilder: (context, i) {
                    final item = usrdt.contactname[i];
                    return Dismissible(
                      key: Key(item),
                      direction: DismissDirection.endToStart,
                      resizeDuration: const Duration(milliseconds: 500),
                      onDismissed: (direction) {
                        setState(() {});
                      },
                      confirmDismiss: (direction) async {
                        return await confirmbox(
                          context,
                          confirmation_msg:
                              "Are you sure you wish to Call $item?",
                          onTap: () {
                            dial(num: usrdt.contactnumber[i]);
                            Navigator.of(context).pop(false);
                          },
                        );
                      },
                      background: Container(
                          color: Colors.greenAccent,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.call,
                                color: Colors.greenAccent,
                              ),
                            ],
                          )),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 30),
                        child: Dismissible(
                          confirmDismiss: (direction) async {
                            return await confirmbox(
                              context,
                              confirmation_msg:
                                  "Do You Really Want To Delete $item?",
                              onTap: () {
                                Navigator.of(context).pop(true);
                              },
                            );
                          },
                          direction: DismissDirection.startToEnd,
                          resizeDuration: const Duration(milliseconds: 500),
                          key: Key(item),
                          onDismissed: (direction) {
                            setState(() {
                              usrdt.contactname.removeAt(i);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(milliseconds: 2000),
                                backgroundColor: Colors.redAccent,
                                content: Row(
                                  children: [
                                    Text('$item dismissed'),
                                    Expanded(child: S()),
                                    InkWell(
                                      highlightColor: Colors.red,
                                      focusColor: Colors.red,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            usrdt.contactname.insert(i, item);
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              duration: const Duration(
                                                  milliseconds: 1000),
                                              backgroundColor:
                                                  Colors.greenAccent,
                                              content:
                                                  Text("$item Adding ...."),
                                            ),
                                          );
                                        },
                                        child: txt(
                                          color: Colors.redAccent,
                                          str: "UNDO",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          background: Container(color: Colors.red),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'contact',
                                  arguments: i);
                              setState(() {});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(),
                              child: viewcall3(
                                lendinga: InkWell(
                                  child: profileimg(
                                    rad: 35,
                                    bgclr: clrpup,
                                    bgimg: usrdt.contactimg[i].toString(),
                                  ),
                                ),
                                mainstr:
                                    txt(str: usrdt.contactname[i], size: 15),
                                substr: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        txt2(str: usrdt.contactnumber[i]),
                                        txt2(
                                          str: usrdt.contactemail[i],
                                        ),
                                        // Text(contactadrees[i]),
                                      ],
                                    ),
                                  ),
                                ),
                                // trailing: Icon(Icons.more_vert),
                              ),
                            ),
                          ),
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
                context: this.context,
                builder: (context) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.all(5),
                    alignment: Alignment.bottomCenter,
                    title: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: txt(
                          color: truefalsevalu.getval()
                              ? Colors.amber
                              : Colors.black,
                          str: 'Add Contact',
                        ),
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
                                        ? profileimg(rad: 50, bgclr: clrpup)
                                        : profileimg(
                                            rad: 50, bgimg: image2!.path),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  txtfild(cntr: ctrname, hintStr: "Name"),
                                  txtfild(cntr: cntrnumber, hintStr: "Number"),
                                  txtfild(cntr: cntradress, hintStr: "Adress"),
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
                            usrdt.contactnumber.add(cntrnumber.text.toString());
                            usrdt.contactimg.add(image!.path);
                            usrdt.contactadrees.add(cntradress.text.toString());
                            usrdt.contactemail.add(cntremail.text.toString());
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("Ok"),
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
