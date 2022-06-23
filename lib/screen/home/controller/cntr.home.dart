import 'package:contactthree/widget/component/widgets.dart';
import 'package:contactthree/widget/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile> pickimggalary() async {
  final ImagePicker picker = ImagePicker();
  XFile? img = await picker.pickImage(
    source: ImageSource.gallery,
  );
  return img as XFile;
}

Widget showimgprofile(XFile? image2,XFile? image,) {
  return StatefulBuilder(
    builder: (context, StateSetter setState) {
      return InkWell(
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
            : profileimg(rad: 50, bgimg: image2!.path),
      );
    }
  );
}
