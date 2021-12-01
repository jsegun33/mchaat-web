import 'package:mchaat_web/core/constants/color_constants.dart';
import 'package:mchaat_web/core/widgets/app_button_widget.dart';
import 'package:mchaat_web/core/widgets/button_widget.dart';
import 'package:mchaat_web/screens/forms/components/add_new_widget.dart';
import 'package:flutter/material.dart';

///jane---
import 'dart:convert';  //for json
import 'package:http/http.dart' as http; //for API
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:mchaat_web/screens/dashboard/components/user_table.dart';


class FormMaterial extends StatefulWidget {
  @override
  _FormMaterialState createState() => _FormMaterialState();
}

class _FormMaterialState extends State<FormMaterial> {
  TextEditingController _User1stName          = TextEditingController();
  TextEditingController _UserLastName         = TextEditingController();
  TextEditingController _UserPosition         = TextEditingController();
  TextEditingController _UserEmailAddress     = TextEditingController();
  TextEditingController _UserContactNo        = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: SingleChildScrollView(
        child: Card(
          color: bgColor,
          elevation: 5,
          margin: EdgeInsets.fromLTRB(32, 32, 64, 32),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Form(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2, // 20%
                      child: Container(color: Colors.red),
                    ),
                    Expanded(
                        flex: 6, // 60%
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "Add New User",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                 controller: _User1stName,
                                decoration: new InputDecoration(
                                  hintText: 'Enter First Name',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                controller: _UserLastName,
                                decoration: new InputDecoration(
                                  hintText: 'Enter Last Name',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                 controller: _UserPosition,
                                decoration: new InputDecoration(
                                  hintText: 'Enter Position',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                 controller: _UserEmailAddress,
                                decoration: new InputDecoration(
                                  hintText: 'Enter Email Address',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                 controller: _UserContactNo,
                                decoration: new InputDecoration(
                                  
                                  hintText: 'Enter Contact No.',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.0),
                            Button(
                              type: ButtonType2.PRIMARY,
                              text: "Add New User",
                               onPressed: () {
                                    _Submit_Add_User();
                                  },
                            ),
                          ],
                        )),
                    Expanded(
                      flex: 2, // 20%
                      child: Container(color: Colors.blue),
                    )
                  ],
                ))),
          ),
        ),
      ),
    );
  }

  void _Submit_Add_User() async  {
      String User1stName          = _User1stName.text.trim();
      String UserLastName         = _UserLastName.text.trim();
      String UserPosition         = _UserPosition.text.trim();
      String UserEmailAddress     = _UserEmailAddress.text.trim();
      String UserContactNo        = _UserContactNo.text.trim();
     
     try{
          if (User1stName.isNotEmpty && UserLastName.isNotEmpty && UserPosition.isNotEmpty  && UserEmailAddress.isNotEmpty && UserContactNo.isNotEmpty) { 
                   http.Response response =  await http.post(Uri.parse('http://127.0.0.1:8000/api/add_mngt_user?User1stName=' + User1stName 
                                + "&UserLastName=" + UserLastName
                                + "&UserPosition=" + UserPosition
                                + "&UserEmailAddress=" + UserEmailAddress
                                + "&UserContactNo=" + UserContactNo
                              ));
                       
                               if (response.statusCode == 200) { 
                                      Fluttertoast.showToast(
                                      msg: "Record Added",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 3,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                    );  
                                      Navigator.of(context, rootNavigator: true).pop();  //close the dialog box
                             }else{
                                      Fluttertoast.showToast(
                                        msg: "Disconnection Occur...\n Pls. Submit AGAIN ",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 3,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                      );
                  
                              }
                 
          }else{

              Fluttertoast.showToast(
                                msg: "Pls. Fill-in the REQUIRED fields",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                              );
                  
          }
       
     }catch(err,stackrace){
      print(err);
      print(stackrace);

                Fluttertoast.showToast(
                        msg: err.toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
      
    }    
   
   }


}
