
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
  RxInt currentPage=1.obs;
  RxBool hasMoreData=true.obs;

  void toggleSearch() {
    isSearchVisible.value = !isSearchVisible.value;
  }
  RxString selectedSubCategoryValue = "".obs;
  RxString selectedCategoryValue = "".obs;
  var products=<String>[].obs;
  var categories = <Map<String, dynamic>>[].obs;
  var subcategories = <Map<String, dynamic>>[].obs;

  get_VisualAid(String categoryId,String subcategoryId,search,{int page=1}) async {
    Map<String,dynamic>param={
      "category_id":categoryId.toString(),
      "subcategory_id":subcategoryId.toString(),
      "search":search.toString(),
    };
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitPost(url: "$visualAids?page=$page",param);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.statusCode.toString()==success_statuscode){
          GetVisualAids productData = GetVisualAids.fromJson(response.body);
          if (productData.visualAids!.isNotEmpty) {
            products.addAll(productData.visualAids!);
            currentPage++;
          } else {
            hasMoreData.value = false;
          }
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