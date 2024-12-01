import 'dart:convert';
import 'package:get/get.dart';

import '../../../api/BaseProvider.dart';
import '../../../constants/Networkconstants.dart';
import '../../../models/GetaddressModel.dart';
import '../../../utils/CommonToast.dart';
import '../../../utils/Progressdialog.dart';
import '../../../utils/Sharedutils.dart';


class Addresslistingcontroller extends GetxController{
  RxInt selectedAddressIndex = 1000.obs; //
  var addressdata=<Data>[].obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Future.microtask(() {
      get_default_address();
      get_all_address();
    });
  }
  get_default_address() async {
    String? jsonResponse = await SharedUtils().get_address_data();
    print("address: ${jsonResponse}");

    if (jsonResponse != null) {
      Map<String, dynamic> userData = jsonDecode(jsonResponse);
      Data addressdetailsModel = Data.fromJson(userData);
      int positioon=addressdata.indexOf(addressdetailsModel);
      print("selected:-"+positioon.toString());
    } else {
      print("No user data found.");
    }
  }
  get_all_address() async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitget2(url: addaddressEndpoint);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.body["status"]==true){
          GetaddressModel data=GetaddressModel.fromJson(response.body);
          addressdata.value=data.data!;
          addressdata.refresh();
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
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
        get_all_address();
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
}