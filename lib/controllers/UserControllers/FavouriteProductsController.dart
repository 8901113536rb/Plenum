
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../models/GetFavouriteModel.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';

class Favouriteproductscontroller extends GetxController{
  TextEditingController searchcontroller=TextEditingController();
  RxBool isSearchVisible = false.obs;

  void toggleSearch() {
    isSearchVisible.value = !isSearchVisible.value;
  }
  final List<String> divisionItems = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ].obs;
  final List<String> categoryItems = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ].obs;
  RxString selectedDivisionValue = "".obs;
  RxString selectedCategoryValue = "".obs;
  var products=<Data>[].obs;
  RxBool favouritestatus=false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  get_favouriteproduct() async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitget2(url: getFavouriteProducts);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.statusCode.toString()==success_statuscode){
          GetFavouriteModel productdata=GetFavouriteModel.fromJson(response.body);
          products.value=productdata.productData!.data!;
          favouritestatus.value=true;
          print("favourite status:---"+favouritestatus.value.toString());
          favouritestatus.refresh();
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }

  addtowishlist(int productid) async {
    Map<String,dynamic>param={"product_id":productid};
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitPost(url: addToFavourite,param);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.body["status"]==true){
          success_toast(response.body["message"].toString());
          favouritestatus.value=true;
          favouritestatus.refresh();
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }

  deletewishlist(int productid) async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitdelete(url: removewishlist+productid.toString(),);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.body["status"]==true){
          success_toast(response.body["message"].toString());
          favouritestatus.value=false;
          get_favouriteproduct();
          favouritestatus.refresh();
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
}