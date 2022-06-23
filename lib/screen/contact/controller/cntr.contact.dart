import 'package:contactthree/screen/contact/view/contact.screen.dart';
import 'package:contactthree/widget/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future<void> sharecontact(int i) async {
  Share.share(
      'Name : ${dt.contactname[i]}\nNumber : ${dt.contactnumber[i]}\nAddress : ${dt.contactadrees[i]} \nMail : ${dt.contactemail[i]} ',
      subject: 'Contact Details');
}

Widget sharebtn(int i) {
  return IconButton(
      onPressed: () {
        sharecontact(i);
      },
      icon: Icon(Icons.share, color: clrblu));
}
