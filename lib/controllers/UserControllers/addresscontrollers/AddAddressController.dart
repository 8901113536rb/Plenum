
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../api/BaseProvider.dart';
import '../../../constants/Networkconstants.dart';
import '../../../utils/CommonToast.dart';
import '../../../utils/Progressdialog.dart';

class Addaddresscontroller extends GetxController{
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
  Future<void> addaddress_api() async {
    showProgressDialog(Get.context!);
    Map<String, dynamic> params = {
      key_houseno: housenocontroller.text.trim(),
      key_city: citycontroller.text.trim(),
      key_state: statecontroller.text.trim(),
      key_street: streetcontroller.text.trim(),
      key_pincode: pincodecodecontroller.text.trim(),
      key_landmark: landmarkcontroller.text.trim(),
    };
    try{
      Response response=await Baseprovider().hitPost(params, url: addaddressEndpoint);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        success_toast(response.body["message"].toString());
        print(response.statusCode.toString());
        if(response.statusCode.toString()==success_statuscode_201){
          Get.back(result: 'addressAdded');
          success_toast(response.body["message"].toString());
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }

}