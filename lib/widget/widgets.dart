import 'package:flutter/material.dart';

Widget txtfild({
  final TextEditingController? cntr,
  final String? hintStr,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: TextField(
      onChanged: (value) {},
      controller: cntr,
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
Widget txt({
  final String? str,
  final String? hintStr,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Text(str!,style: TextStyle(
      color: Colors.black,
      fontSize: 16
    ),),
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
