import 'package:mchaat_web/core/constants/color_constants.dart';
import 'package:mchaat_web/core/utils/colorful_tag.dart';
import 'package:mchaat_web/models/recent_user_model.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:mchaat_web/models/user_model.dart';

//jane---
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';  //for json
import 'package:http/http.dart' as http; //for API
import 'package:mchaat_web/models/function_user_mngt_model.dart'; ///for data model
import 'package:mchaat_web/models/api_endpoint_model.dart'; ///for API model


class UserTable extends StatefulWidget {
  const UserTable({
    Key? key,
  }) : super(key: key);
  _UserTableState createState() => _UserTableState();
}


class _UserTableState extends State<UserTable> {
  FunctionUserMngtModel? _UserMngt;
   // APIendPoint? _UrlEndPoint;
  //  static String BASE_URL = 'http://127.0.0.1:8000/api/';

 _GetListUserMngt()  async {
   
     try{
  http.Response response =  await http.get(Uri.parse( APIendPoint().endpoint! + 'get_active_mngt_user'));
  if (response.statusCode == 200 && response.body != null) { 
    dynamic list = response.body; //'[{"User1stName":"User1stName","UserContactNo":"UserContactNo","UserEmailAddress":"UserEmailAddress","UserLastName":"UserLastName","UserPosition":"UserPosition"},{"User1stName":"jane","UserContactNo":"09985775","UserEmailAddress":"a@gmail.com","UserLastName":"segun","UserPosition":"Manager"}]';
  
        List<Map<String,dynamic>> myMap = List<Map<String,dynamic>>.from(json.decode(list));
        var getLength =  myMap.length -1;
        Map<String, dynamic> responseBody =new Map<String, dynamic>.from(myMap[getLength]);  //myMap[0];
         FunctionUserMngtModel userdata = FunctionUserMngtModel.fromMap(responseBody);
                   setState(() {
                      _UserMngt = userdata;
                    });
                    
                             userTables =[
                             for (int i = 0; i < myMap.length; i++) 
                              UserTables(
                                    icon: "assets/icons/xd_file.svg",
                                    uID:   myMap[i]['UserIDs'].toString(),
                                    name:  myMap[i]['User1stName'].toString() ,
                                    role:  myMap[i]['UserLastName'].toString() ,
                                    email: myMap[i]['UserPosition'].toString(),
                                    date:  myMap[i]['UserEmailAddress'].toString(),
                                    posts: myMap[i]['UserContactNo'].toString() ,
                                   
                                  ),
                              ]; 
                              
                    
  }     
     }catch(err,stackrace){
      print(err);
                 Fluttertoast.showToast(
                        msg: err.toString() ,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
    }    
   
   }


@override
      void initState() { 
       
         // if (_UrlEndPoint != null){
              //   print("working...... "  + APIendPoint().endpoint.toString());
          //  } //call the function for onload event

       _GetListUserMngt();  //function or method name    
          
       
    }
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "User List",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
               
                columns: [
              //  DataColumn(
              //       label: Text("User ID " ),
                    
              //     ),
                  DataColumn(
                    label: Text("First Name " ),
                    
                  ),
                  DataColumn(
                    label: Text("last Name"),
                  ),
                  DataColumn(
                    label: Text("Position"),
                  ),
                  DataColumn(
                    label: Text("Email Addrress"),
                    
                  ),
                  DataColumn(
                    label: Text("Contact No."),
                  ),
                  DataColumn(
                    label: Text("Operation"  ),
                  ),
                ],
                rows:
                 List.generate(
                  userTables.length,
                  (index) => recentUserDataRow(userTables[index], context),
                ),

                
              ),
              

            ),
          ),
           ElevatedButton(
                                onPressed: _GetListUserMngt, 
                              child: Text(
                                    'Refresh Record',
                                    style: TextStyle(color: Colors.white),
                                  ),
                              
                              ),
        ],
      ),
    );
  }
}
//String GetListUser = "GetValue";
    APIendPoint? _BASE_URL;
void UpdateUserMngt(){
    //to update any node
    //  String ShopID            = _ShopID.text.trim();
    //   String shopPartnerID     = _shopPartnerID.text.trim();
    //   String shopSecretKey     = _shopSecretKey.text.trim();
      try{
            // FirebaseDatabaseWeb.instance
            //     .reference()
            //     .child("user_program")
            //     .child("1637835834108")
            //     .update({"User1stName": "0", "UserLastName": "00"  , "UserPosition": "000" });
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
 DeleteUserMngt(userInfo,context) async{    
    var UserIDs  = userInfo.uID.trim();
    print("Delete " + UserIDs);
     try{
          if (UserIDs.isNotEmpty) { 
                   http.Response response =  await http.post(Uri.parse( APIendPoint().endpoint! +'update_deactive_mngt_user?UserIDs=' + UserIDs ));
                               if (response.statusCode == 200) { 
                                      Fluttertoast.showToast(
                                      msg: "Record Deleted",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 3,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                    );  
                                    Navigator.of(context).pop();  //close the dialog box
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
                                msg: "NO Data to Proceed",
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








DataRow recentUserDataRow(UserTables userInfo, BuildContext context) {
 
  return DataRow(
    cells: [
      //  DataCell(Text(userInfo.uID! )),
      DataCell(
        Row(
          children: [
            TextAvatar(
              size: 35,
              backgroundColor: Colors.white,
              textColor: Colors.white,
              fontSize: 14,
              upperCase: true,
              numberLetters: 1,
              shape: Shape.Rectangle,
              text: userInfo.name!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                userInfo.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
     
       DataCell(Text(userInfo.role! )),
      DataCell(Text(userInfo.email!)),
      DataCell(Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getRoleColor(userInfo.date).withOpacity(.2),
            border: Border.all(color: getRoleColor(userInfo.date)),
            borderRadius: BorderRadius.all(Radius.circular(5.0) //
                ),
          ),
          child: Text(userInfo.date!))),
      DataCell(Text(userInfo.posts!)),
      DataCell(
        Row(
          children: [
            // TextButton(
            //   child: Text('View', style: TextStyle(color: greenColor)),
            //   onPressed: () {},
            // ),
            SizedBox(
              width: 6,
            ),
            TextButton(
              child: Text("Delete", style: TextStyle(color: Colors.redAccent)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                          title: Center(
                            child: Column(
                              children: [
                                Icon(Icons.warning_outlined,
                                    size: 36, color: Colors.red),
                                SizedBox(height: 20),
                                Text("Confirm Deletion"),
                              ],
                            ),
                          ),
                          content: Container(
                            color: secondaryColor,
                            height: 70,
                            child: Column(
                              children: [
                                Text(
                                    "Are you sure want to delete '${userInfo.name}'?"),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.close,
                                          size: 14,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.grey),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        label: Text("Cancel")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton.icon(
                                        icon: Icon(
                                          Icons.delete,
                                          size: 14,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                            onPressed: () {DeleteUserMngt(userInfo,context); },
                                       
                                        
                                        label: Text("Delete"))
                                  ],
                                )
                              ],
                            ),
                          ));
                    });
              },
              // Delete
            ),
          ],
        ),
      ),
    ],
  );
}
  



