import 'dart:convert';
import 'package:get/get.dart';

import '../../../api/BaseProvider.dart';
import '../../../constants/Networkconstants.dart';
import '../../../utils/CommonToast.dart';
import '../../../utils/Progressdialog.dart';


class Addresslistingcontroller extends GetxController{
  RxInt selectedAddressIndex = 1000.obs; //
  // Default selected index
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

  }
  delete_address(int id) async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitdelete(url: "$addaddressEndpoint/$id");
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        success_toast(response.body["message"].toString());
        //get_all_address();
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
}