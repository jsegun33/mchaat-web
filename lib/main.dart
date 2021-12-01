import 'package:mchaat_web/core/constants/color_constants.dart';
import 'package:mchaat_web/core/init/provider_list.dart';
import 'package:mchaat_web/screens/login/login_screen.dart';
import 'package:mchaat_web/screens/dashboard/components/user_table.dart';
import 'package:mchaat_web/screens/dashboard/components/platform_table.dart';

import 'package:mchaat_web/screens/home/home_screen.dart';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

Widget build(BuildContext context) {
  return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return MyApp();
        },
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mChaat Web ',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: bgColor, elevation: 0),
        scaffoldBackgroundColor: bgColor,
        primaryColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        buttonColor: greenColor,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
   // home: Login(title: "Welcome to the mChaat Web"),
  //home: HomeScreen(),
  home:PlatformTable(),
    );
  }
}
