import 'package:mchaat_web/models/function_user_mngt_model.dart'; ///for data model
import 'dart:convert';  //for json

class UserTables {
  final String? icon, name, date, posts, role, email,uID;

  UserTables(
      {this.icon, this.name, this.date, this.posts, this.role, this.email, this.uID});
}
 List userTables = [

  // UserTables(
  //   icon: "assets/icons/xd_file.svg",
  //   name: "John",
  //   role: "Doe",
  //   email: "staff",
  //   date: "John@gmail.com",
  //   posts: "09999993432",
  // ),
 
  // UserTables(
  //   icon: "assets/icons/doc_file.svg",
  //   name: "mChaat",
  //   role: "15",
  //   email: "10,000.00",
  //   date: "80%",
  //   posts: "Complete",
  // ),
  // UserTables(
  //   icon: "assets/icons/sound_file.svg",
  //   name: "Carousell",
  //   role: "15",
  //   email: "10,000.00",
  //   date: "80%",
  //   posts: "Complete",
  // ),
  // UserTables(
  //   icon: "assets/icons/media_file.svg",
  //   name: "A**** S**** K****",
  //   role: "Line Manager",
  //   email: "ah****az@google.com",
  //   date: "23-02-2021",
  //   posts: "2",
  // ),
  // UserTables(
  //   icon: "assets/icons/pdf_file.svg",
  //   name: "T***** S****",
  //   role: "UI/UX Designer",
  //   email: "te****cu@google.com",
  //   date: "25-02-2021",
  //   posts: "3",
  // ),
  // UserTables(
  //   icon: "assets/icons/excle_file.svg",
  //   name: "K***** D****",
  //   role: "Business Analyst",
  //   email: "ke****an@gmail.com",
  //   date: "25-02-2021",
  //   posts: "34",
  // ),
];
