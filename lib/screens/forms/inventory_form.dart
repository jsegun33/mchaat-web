import 'package:mchaat_web/core/constants/color_constants.dart';
import 'package:mchaat_web/core/widgets/app_button_widget.dart';
import 'package:mchaat_web/core/widgets/button_widget.dart';
import 'package:mchaat_web/screens/forms/components/add_new_widget.dart';
import 'package:flutter/material.dart';

class InventoryPlatform extends StatefulWidget {
  @override
  _InventoryPlatformState createState() => _InventoryPlatformState();
}

class _InventoryPlatformState extends State<InventoryPlatform> {
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
                                "Add New Product",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                decoration: new InputDecoration(
                                  hintText: 'Product Name *',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                decoration: new InputDecoration(
                                  hintText: 'Qty*',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            ListTile(
                              title: new TextField(
                                decoration: new InputDecoration(
                                  hintText: 'Vendor *',
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white)),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.0),
                            Button(
                              type: ButtonType2.PRIMARY,
                              text: "Save Product",
                              onPressed: () {},
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
}
