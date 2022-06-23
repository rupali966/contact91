import 'package:contactthree/screen/CustomButtonTest/controller/cntr.cutom.btn.dart';
import 'package:contactthree/screen/CustomButtonTest/modal/MenuItm.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomButtonTest extends StatefulWidget {
   CustomButtonTest(this.num, {Key? key}) : super(key: key);
  int num;
  @override
  State<CustomButtonTest> createState() => _CustomButtonTestState();
}

class _CustomButtonTestState extends State<CustomButtonTest> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        color: Colors.blue,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            customItemsIndexes: const [3],
            items: [
              ...MenuItems_two.firstItems.map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: MenuItems_two.buildItem(item),
                ),
              ),
            ],
            onChanged: (value) {

              MenuItems_two.onChanged(context, value as MenuItem_two,widget.num);
            },
            dropdownWidth: 160,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
    );
  }
}
