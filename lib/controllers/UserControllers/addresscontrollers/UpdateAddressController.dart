import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api/BaseProvider.dart';
import '../../../constants/Networkconstants.dart';
import '../../../utils/CommonToast.dart';
import '../../../utils/Progressdialog.dart';

class Updateaddresscontroller extends GetxController{
  var housenocontroller=TextEditingController();
  var citycontroller=TextEditingController();
  var statecontroller=TextEditingController();
  var streetcontroller=TextEditingController();
  var pincodecodecontroller=TextEditingController();
  var landmarkcontroller=TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }
  Future<void> updateaddress_api(String id) async {
    showProgressDialog(Get.context!);
    String endpoint = 'address/$id';
    String url = '$vhBaseUrl$endpoint';
    String jsonParams = jsonEncode({
      key_houseno: housenocontroller.text.trim(),
      key_city: citycontroller.text.trim(),
      key_state: statecontroller.text.trim(),
      key_street: streetcontroller.text.trim(),
      key_pincode: pincodecodecontroller.text.trim(),
      key_landmark: landmarkcontroller.text.trim(),
    });
    try {
      Response response = await Baseprovider().hitPut(
        jsonParams, // Send the JSON string as the body
        url: url,
      );

      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');

      if (response.status.hasError) {
        failed_toast(response.body["message"].toString());
      } else {
        if (response.statusCode.toString() == success_statuscode) {
          Get.back(result: 'addressUpdated');
          success_toast(response.body["message"].toString());
        }
      }
    } catch (e) {
      hideprogressDialog(Get.context!); // Ensure dialog is hidden in case of error
      print('Error: ${e.toString()}');
    }
  }

}