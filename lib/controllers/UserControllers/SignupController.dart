
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:plenum/views/UserSection/SigninScreen.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';


class SignupController extends GetxController {
  var firstname_controller = TextEditingController();
  var lastname_controller = TextEditingController();
  var email_controller = TextEditingController();
  var phone_controller = TextEditingController();
  var password_controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool yourpasswordObscured = true.obs;

  void  yourPasswordVisibility() {
    yourpasswordObscured.value = !yourpasswordObscured.value;
  }
  Future<void> signup_user() async {
    showProgressDialog(Get.context!);
    Map<String, dynamic> params = {
      key_firstname: firstname_controller.text.trim(),
      key_lastname: lastname_controller.text.trim(),
      key_email: email_controller.text.trim(),
      key_phone: phone_controller.text.trim(),
      key_password: password_controller.text.trim(),
    };
    try {
      Response response =
      await Baseprovider().hitPost2(params, url: signup_endpoint);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        success_toast(response.body["message"].toString());
        if (response.body["success"] == true) {
          Fluttertoast.showToast(
              msg: response.body["message"].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Get.to(const SigninScreen());
        }
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

}
