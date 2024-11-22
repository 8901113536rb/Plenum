import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

}