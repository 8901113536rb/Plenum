
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Addaddresscontroller extends GetxController{
  var addresslinecontroller=TextEditingController();
  var citycontroller=TextEditingController();
  var statecontroller=TextEditingController();
  var postalcodecontroller=TextEditingController();
  var countrycontroller=TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

}