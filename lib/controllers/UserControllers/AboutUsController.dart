
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../models/GetAboutUs.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';

class Aboutuscontroller extends GetxController{

  Rx<GetAboutUs?> products = Rx<GetAboutUs?>(null);

  @override
  void onInit() {
    super.onInit();
  }
  get_aboutdata() async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitget2(url: aboutus);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.statusCode.toString()==success_statuscode){
          GetAboutUs productdata=GetAboutUs.fromJson(response.body);
          products.value=productdata;
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
}