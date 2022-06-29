import 'dart:io';

import 'package:contactthree/widget/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

Widget txtfild({
  final TextEditingController? cntr,
  final String? hintStr,
  int? height,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: TextField(
      onChanged: (value) {},
      controller: cntr,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: 10,
      ),
      maxLines: height,
      decoration: InputDecoration(
        hintText: hintStr,
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.blue.shade200,
          width: 1,
        )),
      ),
    ),
  );
}

Widget profileimg({
  final String bgimg = "",
  final Color? bgclr,
  final double? rad,
}) {
  // if (bgimg!.isNotEmpty) {
  //   return CircleAvatar(
  //     radius: rad,
  //     backgroundImage: AssetImage(bgimg!),
  //     //   FileImage(
  //     //   File(bgimg),
  //     // ),
  //     backgroundColor: clrpup,
  //   );
  // } else {
  return CircleAvatar(
    radius: rad,
    backgroundImage: FileImage(
      File(bgimg),
    ),
    backgroundColor: clrpup,
  );
  // }
}

Widget txt({
  final String? str,
  final String? hintStr,
  final Color? color,
  final TextDecoration? decoration,
  final double? size,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Text(
      str!,
      style: TextStyle(
          color: color,
          fontSize: size,
          decoration: decoration,
          fontWeight: FontWeight.w400),
    ),
  );
}

Widget txt2({
  final String? str,
  final String? hintStr,
  final Color? color,
  final TextDecoration? decoration,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Text(
      str!,
      style: TextStyle(
          color: (color == null) ? color : Colors.grey.shade900,
          fontSize: 10,
          decoration: decoration,
          fontWeight: FontWeight.w300),
    ),
  );
}

Widget S({
  final double? h,
  final double? w,
}) {
  return SizedBox(
    height: h,
    width: w,
  );
}

void dial({String? num}) {
  FlutterPhoneDirectCaller.callNumber(
    num!,
  );
}

Future<void> msg({String? num}) async {
  final Uri uri = Uri.parse('sms:$num');
  await launchUrl(uri);
}

Future<void> video({String? num}) async {
  final Uri emailLaunchUri = Uri(
      scheme: 'https:',
      path: 'wa.me',
      query:
          encodeQueryParameters(<String, String>{'subject': '919427516924'}));
  // final Uri uri = Uri.parse('/919427516924?text=SAMPLE TEXT');
  await launchUrl(emailLaunchUri);
}

Future<void> emailto({String? email, String? subject}) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: '$email',
    query: encodeQueryParameters({'subject': '$subject'}),
  );
  await launchUrl(emailLaunchUri);
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

Widget viewcall({
  String? infotxt,
  String? maintxt,
  required final Color clr,
  final TextDecoration? decoration,
  final Color? maintxtclr,
  GestureTapCallback? onTap,
}) {
  return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
            color: clr,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              txt2(str: infotxt),
              InkWell(
                  onTap: onTap,
                  child: txt(
                      str: maintxt, decoration: decoration, color: maintxtclr)),
            ],
          ),
          Expanded(child: S()),
        ],
      ));
}

Widget viewcall2({
  final String? mainstr,
  final String? substr,
  final Widget? trailing,
  final Color? mainclr,
  GestureTapCallback? mainTap,
  final Widget? leading,
}) {
  return ListTile(
    leading: leading,
    title: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        txt2(str: substr),
        InkWell(onTap: mainTap, child: txt(str: mainstr, color: mainclr)),
      ],
    ),
    trailing: trailing,
  );
}

Widget txtbtn({
  required VoidCallback? clk,
  String? str,
  final Color? clr,
}) {
  return TextButton(
    child: Text(str!,
        style: TextStyle(
          color: clr,
          fontSize: 12,
        )),
    onPressed: clk,
  );
}

Widget viewcall3({
  final Widget? mainstr,
  final Widget? substr,
  final Color? mainclr,
  GestureTapCallback? mainTap,
  List<Widget> tralling = const <Widget>[],
  final Widget? lendinga,
}) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Expanded(
      child: Row(
        children: [
          Container(
            child: lendinga,
          ),
          S(w: 7),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                S(h: 5),
                InkWell(onTap: mainTap, child: Container(child: mainstr)),
                Container(child: substr),
              ],
            ),
          ),
          Expanded(child: S()),
          Row(children: tralling),
        ],
      ),
    ),
  );
}

Future confirmbox(BuildContext context,
    {GestureTapCallback? onTap, String confirmation_msg = ""}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm"),
        content: Text(confirmation_msg),
        actions: [
          TextButton(onPressed: onTap, child: const Text("Yes")),
          TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("No"))
        ],
      );
    },
  );
}
