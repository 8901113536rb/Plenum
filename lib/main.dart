import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:plenum/views/SplashScreen.dart';
import 'package:plenum/views/UserSection/BottomNavUi.dart';
import 'package:plenum/views/UserSection/DashboardUi.dart';
import 'package:sizer/sizer.dart';
import 'constants/Appcolors.dart';
import 'constants/stringconstants.dart';

void main() {
  runApp( MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: themecolor, // navigation bar color
    statusBarColor: themecolor, // status bar color
  ));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
      Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: appname,
              theme: ThemeData(
                useMaterial3: false,
                scaffoldBackgroundColor: white,
                fontFamily: "Montserrat",
                primarySwatch: Colors.red,
              ),
              // home: BottomNavScreen()
              home: SplashScreen()
          );
        },
      );
  }
}

