import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:plenum/utils/NotificationService.dart';
import 'package:plenum/views/SplashScreen.dart';
import 'package:plenum/views/UserSection/BottomNavUi.dart';
import 'package:plenum/views/UserSection/DashboardUi.dart';
import 'package:plenum/views/UserSection/SignupSuccess.dart';
import 'package:sizer/sizer.dart';
import 'constants/Appcolors.dart';
import 'constants/stringconstants.dart';

Future<void> main() async {
  runApp( MyApp());
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: themecolor, // navigation bar color
    statusBarColor: themecolor, // status bar color
  ));
  NotificationService().initializeNotifications();
  NotificationService().setupFirebaseListeners();
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
              // home: const SignupSuccess()
              home: SplashScreen()
          );
        },
      );
  }
}

