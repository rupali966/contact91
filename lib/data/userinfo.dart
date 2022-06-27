class data {
  List contactnumber = ["9427516924", "9664920749", "9428660088"];
  List contactname = ["Jaydeep", "RJ", "Rupali"];
  List contactadrees = ["444,Suryanagar", "444,Suryanagar", "Shivajinagar"];
  List contactemail = [
    "Jaydeepwagh919@gmail.com",
    "chief.strategist.j@gmail.com",
    "Rupalikoli919@gmail.com"
  ];
  List contactimg = ["asset/pic1.png", "asset/pic2.png", "asset/pic3.png"];

  // List contactnumber = [];
  // List contactname = [];
  // List contactadrees = [];
  // List contactemail = [];
  // List contactimg = [];

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
