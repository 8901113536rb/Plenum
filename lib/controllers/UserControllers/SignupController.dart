
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
}
