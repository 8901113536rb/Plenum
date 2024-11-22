
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class Createnewpassword_controller extends GetxController{
  var newpassword_controller=TextEditingController();
  var confirmpassword_controller=TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool newObscured = true.obs;
  RxBool confirmObscured = true.obs;

  void toggleNewPasswordVisibility() {
    newObscured.value = !newObscured.value;
  }
  void toggleConfirmPasswordVisibility() {
    confirmObscured.value = !confirmObscured.value;
  }
}