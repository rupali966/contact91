import 'package:shared_preferences/shared_preferences.dart';

class data {
  List contactnumber = [
    "942751XXXX",
    "966492XXXX",
    "942866XXXX",
    "942866XXXX",
    "942866XXXX",
    "942866XXXX",
    "942866XXXX",
    "942866XXXX",
    "942866XXXX",
  ];
  List contactname = <String>[
    "Sundar",
    "Elon",
    "Steve",
    "Marry",
    "Rozzy",
    "Nina",
    "Jaydeep",
    "RJ",
    "Rupali",
  ];
  List contactadrees = [
    "404,USA",
    "454,France",
    "644,China",
    "494,Korea",
    "844,Pakistan",
    "445,England",
    "444,Suryanagar",
    "464,Akashganaga",
    "689,Shivajinagar",
  ];
  List contactemail = [
    "Sundarwagh919@gmail.com",
    "Elontandel810@gmail.com",
    "Steverathod91@gmail.com",
    "Marryrao4490@gmail.com",
    "JaydeepRozzy919@gmail.com",
    "Nina919@gmail.com",
    "Jaydeepwagh919@gmail.com",
    "chief.strategist.j@gmail.com",
    "Rupalikoli919@gmail.com",
  ];
  List contactimg = [
    "asset/ceo.jpg",
    "asset/ceo3.jpg",
    "asset/ceo2.jpg",
    "asset/fceo.jpg",
    "asset/fceo2.jpg",
    "asset/fceo3.jpg",
    "asset/pic1.png",
    "asset/pic2.png",
    "asset/pic3.png",
  ];

  void setname(int? num, String no) async {
    // Obtain shared preferences.
    this.contactname.insert(num!, no);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('name', contactname as List<String>);
  }

  void getdata(
      {String? contactnumber,
      String? contactname,
      String? contactadrees,
      String? contactemail,
      String? contactimg,
      int? num}) {
    this.contactnumber.insert(num!, contactnumber);
    this.contactname.insert(num, contactname);
    this.contactadrees.insert(num, contactadrees);
    this.contactemail.insert(num, contactemail);
    this.contactimg.insert(num, contactimg);
  }
}
