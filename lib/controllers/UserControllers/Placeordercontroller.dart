import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:plenum/utils/Sharedutils.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../models/GetCartModel.dart' as cartdata;
import '../../models/GetaddressModel.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';
import '../../views/UserSection/PlaceOrderSuccess_screen.dart';


class Placeordercontroller extends GetxController{
  Rx<Data?> addressdata = Rx<Data?>(null);
  // Rx<Data?> default_address = Rx<Data?>(null);
 // RxDouble totalAmount=0.0.obs;
  var products=<cartdata.ProductData>[].obs;


  get_orders() async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitget2(url: getCartProducts);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.statusCode.toString()==success_statuscode){
          cartdata.GetCartModel productdata=cartdata.GetCartModel.fromJson(response.body);
          products.value=productdata.productData!;
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }

  get_default_address() async {
    String? jsonResponse = await SharedUtils().get_address_data();
    print("address: ${jsonResponse}");

    if (jsonResponse != null) {
      Map<String, dynamic> userData = jsonDecode(jsonResponse);
      addressdata.value = Data.fromJson(userData);
      // int positioon=addressdata.indexOf(addressdetailsModel);
      // print("selected:-"+positioon.toString());
    } else {
      print("No user data found.");
    }
  }

  placeorder(String addressid) async {
    final Map<String, dynamic> param = {
      key_address_id: addressid,
    };
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitPost(url: orderplace_endpoint,param);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        // success_toast(response.body["message"].toString());
        Get.to(PlaceordersuccessScreen());
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
  removeCartProduct(String productid) async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitdelete(url: removecartproduct+productid.toString(),);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.body["status"]==true){
          success_toast(response.body["message"].toString());
          get_orders();
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
}