import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

Widget txtfild({
  final TextEditingController? cntr,
  final String? hintStr,
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
  return CircleAvatar(
    radius: rad,
    backgroundImage: FileImage(
      File(bgimg),
    ),
    backgroundColor: bgclr,
  );
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
