
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  RxString selectedSubCategoryValue = "".obs;
  RxString selectedCategoryValue = "".obs;
  var products=<String>[].obs;
  var categories = <Map<String, dynamic>>[].obs;
  var subcategories = <Map<String, dynamic>>[].obs;
  @override
  void onInit() {
    super.onInit();
  }
  get_VisualAid(String categoryId,String subcategoryId,search) async {
    Map<String,dynamic>param={
      "category_id":categoryId.toString(),
      "subcategory_id":subcategoryId.toString(),
      "search":search.toString(),
    };
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitPost(url: visualAids,param);
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
  Future<void> fetchCategoriesData() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      String? jsonData = prefs.getString('categories_data');
      if (jsonData != null) {
        var data = jsonDecode(jsonData);

        // Ensure the data is a list of maps
        if (data is List) {
          categories.value = List<Map<String, dynamic>>.from(data);
        } else {
          print("Invalid data format for categories.");
        }
        print("Fetched categories data: ${categories.value}");
      } else {
        print("No categories data found in SharedPreferences.");
      }
    } catch (e) {
      print("Error fetching categories data: $e");
    }
  }

  get_subcategory(categoryid) async {
    Map<String,dynamic>param={"categoryid":categoryid.toString()};
    showProgressDialog(Get.context!);
    try {
      Response response=await Baseprovider().hitPost(url: subcategories_endpoint,param);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if (response.body["status"] == true) {
          List<dynamic> data = response.body["data"];
          subcategories.value = data.map((item) {
            return {
              'id': item['id'],
              'name': item['name'],
            };
          }).toList();
          print("All subcategories --> $subcategories");
        } else {
          print('Failed to fetch subcategories: ${response.body["message"]}');
          failed_toast(response.body["message"].toString());
        }
      }
    } catch (e) {
      failed_toast('An error occurred while fetching subcategories.');
    }
  }
}