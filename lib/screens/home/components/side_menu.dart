import 'package:mchaat_web/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mchaat_web/screens/inventory/inventory_screen.dart';
import 'package:mchaat_web/screens/platform/platform_screen.dart';
import 'package:mchaat_web/screens/user-management/user_management_screen.dart';

import '../home_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: defaultPadding * 3,
                ),
                Image.asset(
                  "assets/logo/logo_icon.png",
                  scale: 5,
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Text("mChaat - Web")
              ],
            )),
            DrawerListTile(
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            DrawerListTile(
              title: "User Management",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserManagementScreen()),
                );
              },
            ),
            DrawerListTile(
              title: "List of Platform",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlatformScreen()),
                );
              },
            ),
            DrawerListTile(
              title: "Inventory",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InventoryScreen()),
                );
              },
            ),
            DrawerListTile(
              title: "Sales Management",
              svgSrc: "assets/icons/menu_store.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Reports",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}