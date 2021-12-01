import 'package:mchaat_web/core/constants/color_constants.dart';
import 'package:mchaat_web/core/widgets/app_button_widget.dart';
import 'package:mchaat_web/core/widgets/button_widget.dart';
import 'package:mchaat_web/screens/forms/components/add_new_widget.dart';
import 'package:flutter/material.dart';


//jane---
import 'dart:convert';  //for json
import 'package:http/http.dart' as http; //for API
import 'package:fluttertoast/fluttertoast.dart';

class FormPlatform extends StatefulWidget {
  @override
  _FormPlatformState createState() => _FormPlatformState();
}

class _FormPlatformState extends State<FormPlatform> {
  TextEditingController _ShopName               = TextEditingController();
  TextEditingController _ShopIDs                = TextEditingController();
  TextEditingController _ShopPartnerIDs         = TextEditingController();
  TextEditingController _ShopSecretKey          = TextEditingController();
  TextEditingController _ShopPartnerName        = TextEditingController();


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
                                "Add New Platform",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Text(
                              "Integration of Credentials",
                              style: TextStyle(fontSize: 30),
                            ),
                            ListTile(
                              title: new TextField(
                                 controller: _ShopName,
                                decoration: new InputDecoration(
                                  hintText: 'Shop Name *',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                controller: _ShopIDs,
                                decoration: new InputDecoration(
                                  hintText: 'Shop ID*',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                 controller: _ShopPartnerIDs,
                                decoration: new InputDecoration(
                                  hintText: 'Shop Partner ID *',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),

                            ListTile(
                              title: new TextField(
                                  controller: _ShopPartnerName,
                                decoration: new InputDecoration(
                                  hintText: 'Shop Partner Name *',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                  controller: _ShopSecretKey,
                                decoration: new InputDecoration(
                                  hintText: 'Shop Secret Key *',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.0),
                            Button(
                              type: ButtonType2.PRIMARY,
                              text: "Save Platform",
                              onPressed: () {  _Submit_CredData(); },
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
  _Submit_CredData() async{
   
            String ShopName           = _ShopName.text.trim();
            String ShopIDs            = _ShopIDs.text.trim();
            String ShopPartnerIDs     = _ShopPartnerIDs.text.trim();
            String ShopSecretKey      = _ShopSecretKey.text.trim();
            String ShopPartnerName    = _ShopPartnerName.text.trim();

             try{
          if (ShopName.isNotEmpty && ShopIDs.isNotEmpty && ShopPartnerIDs.isNotEmpty  && ShopSecretKey.isNotEmpty && ShopPartnerName.isNotEmpty) { 
                   http.Response response =  await http.post(Uri.parse('http://127.0.0.1:8000/api/add_platform_credentials?ShopName=' + ShopName 
                                + "&ShopIDs=" + ShopIDs
                                + "&ShopPartnerIDs=" + ShopPartnerIDs
                                + "&ShopSecretKey=" + ShopSecretKey
                                + "&ShopPartnerName=" + ShopPartnerName
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
