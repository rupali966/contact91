import 'package:contactthree/screen/CustomButtonTest/modal/MenuItm.dart';
import 'package:contactthree/screen/contact/controller/cntr.contact.dart';
import 'package:contactthree/screen/contact/view/contact.screen.dart';
import 'package:contactthree/screen/home/controller/cntr.home.dart';
import 'package:contactthree/widget/component/widgets.dart';
import 'package:contactthree/widget/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class MenuItems_two {
  static const List<MenuItem_two> firstItems = [
    home,
    share,
    settings,
    edit,
  ];

  static const home = MenuItem_two(text: 'Home', icon: Icons.home);
  static const share = MenuItem_two(text: 'Share', icon: Icons.share);
  static const settings = MenuItem_two(text: 'Settings', icon: Icons.settings);
  static const edit = MenuItem_two(text: 'Edit', icon: Icons.edit);

  static Widget buildItem(MenuItem_two item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: Colors.white,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem_two item, int i) {
    switch (item) {
      case MenuItems_two.home:
        // Do something
        break;
      case MenuItems_two.settings:
        //Do something
        break;
      case MenuItems_two.share:
        sharecontact(i);
        break;
      case MenuItems_two.edit:
        showDialog(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            TextEditingController name = TextEditingController();
            TextEditingController adr = TextEditingController();
            TextEditingController mail = TextEditingController();
            TextEditingController num = TextEditingController();
            XFile? image;
            XFile? image2;
            return SingleChildScrollView(
              child: Column(
                children: [
                  StatefulBuilder(builder: (context, StateSetter setState) {
                    return AlertDialog(
                      title: const Text(
                        'Edit Contact',
                      ),
                      content: ListBody(
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
                                ? profileimg(rad: 50, bgclr: clrblu)
                                : profileimg(
                                rad: 50, bgimg: image2!.path),
                          ),
                          txtfild(hintStr: "Name", cntr: name),
                          txtfild(hintStr: "Address", cntr: adr),
                          txtfild(hintStr: "Contact", cntr: num),
                          txtfild(hintStr: "Email", cntr: mail),
                        ],
                      ),
                      actions: [
                        txtbtn(
                            clk: () {
                              dt.contactname[i] = name.text.toString();
                              dt.contactnumber[i] = num.text.toString();
                              dt.contactemail[i] = mail.text.toString();
                              dt.contactadrees[i] = adr.text.toString();
                              dt.contactimg[i] = image2!.path;
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                            str: "Save"),
                        txtbtn(
                          clk: () {
                            Navigator.of(context).pop();
                          },
                          str: "Close",
                          clr: Colors.redAccent,
                        ),
                      ],
                    );
                  }),
                ],
              ),
            );
          },
        );
        break;
    }
  }
}
