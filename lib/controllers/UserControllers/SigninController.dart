import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final formKey = GlobalKey<FormState>();
  RxBool isObscured = true.obs;

  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }

  @override
  void onInit() {
    super.onInit();
  }
  Future<void> signin_user() async {
    showProgressDialog(Get.context!);
    Map<String, dynamic> params = {key_email: emailcontroller.text.trim(),key_password: passwordcontroller.text.trim(),};
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