import 'package:mchaat_web/core/constants/color_constants.dart';
import 'package:mchaat_web/responsive.dart';

import 'package:mchaat_web/screens/dashboard/components/mini_information_card.dart';

import 'package:mchaat_web/screens/dashboard/components/recent_forums.dart';
import 'package:mchaat_web/screens/dashboard/components/recent_users.dart';
import 'package:mchaat_web/screens/dashboard/components/user_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:mchaat_web/screens/forms/input_form.dart';
import 'package:mchaat_web/screens/forms/inventory_form.dart';
import 'package:mchaat_web/screens/forms/platform_form.dart';

import 'components/header.dart';
import 'components/header2.dart';
import 'components/inventory_table.dart';
import 'components/platform_table.dart';
import 'components/user_table.dart';

class InventoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header2(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Inventory    >   List of Inventory'),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding /
                            (Responsive.isMobile(context) ? 2 : 1),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return new InventoryPlatform();
                          },
                          fullscreenDialog: true));
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      "Add New Inventory",
                    ),
                  ),
                ],
              ),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        //MyFiels(),
                        //SizedBox(height: defaultPadding),
                        InventoryTable(),
                        // SizedBox(height: defaultPadding),
                        // // RecentDiscussions(),
                        // if (Responsive.isMobile(context))
                        //   SizedBox(height: defaultPadding),
                        // if (Responsive.isMobile(context)) UserDetailsWidget(),
                      ],
                    ),
                  ),
                  // if (!Responsive.isMobile(context))
                  //   SizedBox(width: defaultPadding),
                  // // On Mobile means if the screen is less than 850 we dont want to show it
                  // if (!Responsive.isMobile(context))
                  //   Expanded(
                  //     flex: 2,
                  //     child: UserDetailsWidget(),
                  //   ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
