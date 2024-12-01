
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../models/GetVisualAids.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';

class Visualaidcontroller extends GetxController{
  TextEditingController searchcontroller=TextEditingController();
  RxBool isSearchVisible = false.obs;
  final List<String> imageUrls = [
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
  ].obs;
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
  var products=<String>[].obs;
  @override
  void onInit() {
    super.onInit();
  }
  get_VisualAid() async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitget2(url: visualAids);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.statusCode.toString()==success_statuscode){
          GetVisualAids productdata=GetVisualAids.fromJson(response.body);
          products.value=productdata.visualAids!;
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }

}