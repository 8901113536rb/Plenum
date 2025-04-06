import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../constants/stringconstants.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';
import '../../utils/Sharedutils.dart';
import '../../views/UserSection/BottomNavUi.dart';

class SigninController extends GetxController{
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var fcmToken="".obs;
  RxBool isObscured = true.obs;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }

  @override
  void onInit() {
    super.onInit();
    if(Platform.isAndroid){
      requestAndroidNotificationPermission();
    }else{
      requestIosPermission();
    }
    getFirebaseMessagingToken();
  }
  Future<void> requestAndroidNotificationPermission() async {
    // Check if we already have permission
    PermissionStatus status = await Permission.notification.status;

    if (status.isDenied || status.isRestricted) {
      // Request permission if it's denied or restricted
      PermissionStatus newStatus = await Permission.notification.request();

      if (newStatus.isGranted) {
        print("Notification permission granted");
      } else {
        print("Notification permission denied");
      }
    } else {
      print("Notification permission already granted");
    }
  }
  Future<void> requestIosPermission() async {
    final IOSFlutterLocalNotificationsPlugin? iOSPlugin = flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();

    if (iOSPlugin != null) {
      bool? granted = await iOSPlugin.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );

      if (granted == true) {
        print("Notification permission granted.");
      } else {
        print("Notification permission denied.");
      }
    }
  }

  Future<void> getFirebaseMessagingToken() async {
    FirebaseMessaging fMessaging = FirebaseMessaging.instance;

    await fMessaging.requestPermission();

    await fMessaging.getToken().then((token) async {
      if (token != null) {
        debugPrint("Fcm token:-$token");
        fcmToken.value=token;
        await SharedUtils().saveFcmToken(token);
      }
    });
  }
  Future<void> signin_user() async {
    showProgressDialog(Get.context!);
    Map<String, dynamic> params = {key_email: emailcontroller.text.trim(),key_password: passwordcontroller.text.trim(),key_fcm_token:fcmToken.value};
    try{
      Response response=await Baseprovider().hitPost2(params, url: loginEndpoint);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
    print('Error: ${response.statusText}');
        failed_toast(wrong_credentials);
      } else {
        // success_toast(response.body["message"].toString());
        if(response.isOk==true){
          success_toast(Login_successfully);
          String userdetails=jsonEncode(response.body["user"]);
          await SharedUtils().save_user_data(userdetails);
          await SharedUtils().save_token(response.body["token"]);
          await SharedUtils().save_userfirstname(response.body["user"]["first_name"] ?? "N/A");
          await SharedUtils().save_userlastname(response.body["user"]["last_name"] ?? "N/A");
          await SharedUtils().save_useremail(response.body["user"]["email"] ?? "N/A");
          await SharedUtils().save_userphone(response.body["user"]["phone"] ?? "N/A");
          await SharedUtils().save_userimage(response.body["user"]["image"] ?? "");
          Get.offAll(BottomNavScreen());
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }

}