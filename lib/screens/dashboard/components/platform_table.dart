import 'package:mchaat_web/core/constants/color_constants.dart';
import 'package:mchaat_web/core/utils/colorful_tag.dart';
import 'package:mchaat_web/models/platform_model.dart';
import 'package:mchaat_web/models/recent_user_model.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:mchaat_web/models/user_model.dart';

//jane---
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';  //for json
import 'package:http/http.dart' as http; //for API
import 'package:mchaat_web/models/api_endpoint_model.dart'; ///for API model
import 'package:mchaat_web/models/function_user_mngt_model.dart'; ///for data model
class PlatformTable extends StatefulWidget {
  const PlatformTable({
    Key? key,
  }) : super(key: key);
_PlatformTable createState() => _PlatformTable();
}


class _PlatformTable extends State<PlatformTable> {
  FunctionUserMngtModel? _UserMngt;

  _GetListPlatformCred()  async {
     try{
      http.Response response =  await http.get(Uri.parse( APIendPoint().endpoint! + 'get_active_platform_credentials'),
          headers: {
             'Content-Type': 'application/json',
             "Access-Control-Allow-Origin":"*",
            }
      );
 if (response.statusCode == 200 && response.body != null) { 
      print(response.statusCode);
        dynamic list = response.body; //'[{"CredIDs":"516537760","DateInserted":"2021-12-01 10:27:34","ShopIDs":"ShopIDs","ShopName":"ShopName","ShopPartnerIDs":"ShopPartnerIDs","ShopPartnerName":"ShopPartnerName","ShopSecretKey":"ShopSecretKey","UserActive":"1"},{"CredIDs":"430390972","DateInserted":"2021-12-01 11:13:05","ShopIDs":"asasssssss","ShopName":"asasssss","ShopPartnerIDs":"asassss","ShopPartnerName":"sasasasa","ShopSecretKey":"asasasas","UserActive":"1"}]';
        List<Map<String,dynamic>> myMap = List<Map<String,dynamic>>.from(json.decode(list));
        var getLength =  myMap.length -1;
         Map<String, dynamic> responseBody =new Map<String, dynamic>.from(myMap[getLength]);  //myMap[0];
          FunctionUserMngtModel userdata = FunctionUserMngtModel.fromMap(responseBody);
                   setState(() {
                      _UserMngt = userdata;
                    });
                             platformTables =[
                             for (int i = 0; i < myMap.length; i++) 
                                PlatformTables(
                                  icon: "assets/icons/xd_file.svg",
                                  name: "Shopee " +  myMap[i]['CredIDs'].toString(),
                                  role: "Lorem Ipsum",
                                  email: "5",
                                ),
                              ]; 
     }else{
                    Fluttertoast.showToast(
                        msg: "Unable to Connect to SERVER" ,
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
      void initState() {  //call the function for onload event
        _GetListPlatformCred();  //function or method name    
        // if (_UserMngt != null)
        //    print("working...... " + _UserMngt!.User1stName.toString());
    }
  

  @override
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
            "Platform List",
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
                  DataColumn(
                    label: Text("Name"),
                  ),
                  DataColumn(
                    label: Text("Description"),
                  ),
                  DataColumn(
                    label: Text("Total Item Sync"),
                  ),
                  DataColumn(
                    label: Text("Action"),
                  ),
                ],
                rows: List.generate(
                  platformTables.length,
                  (index) => recentUserDataRow(platformTables[index], context),
                ),
              ),
            ),
          ),
           ElevatedButton(
                                onPressed: _GetListPlatformCred, 
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


DataRow recentUserDataRow(PlatformTables userInfo, BuildContext context) {
  return DataRow(
    cells: [
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
      DataCell(Text(userInfo.role!)),
      DataCell(Text(userInfo.email!)),
      DataCell(
        Row(
          children: [
            TextButton(
              child:
                  Text('View my Store', style: TextStyle(color: Colors.orange)),
              onPressed: () {},
            ),
            TextButton(
              child: Text('View', style: TextStyle(color: greenColor)),
              onPressed: () {},
            ),
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
                                        onPressed: () {},
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
