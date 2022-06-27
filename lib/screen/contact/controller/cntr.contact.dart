import 'package:contactthree/screen/home/view/home.screen.dart';
import 'package:contactthree/widget/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future<void> sharecontact(int i) async {
  Share.share(
      'Name : ${usrdt.contactname[i]}\nNumber : ${usrdt.contactnumber[i]}\nAddress : ${usrdt.contactadrees[i]} \nMail : ${usrdt.contactemail[i]} ',
      subject: 'Contact Details');
}

Widget sharebtn(int i) {
  return IconButton(
      onPressed: () {
        sharecontact(i);
      },
      icon: Icon(Icons.share, color: clrblu));
}
