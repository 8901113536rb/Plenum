import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:plenum/models/GetAboutUs.dart';
import 'package:plenum/utils/Progressdialog.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../models/GetBannerModel.dart';
import '../../models/GetCategoriesModel.dart' as category;
import '../../utils/CommonToast.dart';
import '../../utils/Sharedutils.dart';


class Dashboardcontroller extends GetxController{
  final key = GlobalKey<ExpandableFabState>();
  RxDouble currentIndex=0.0.obs;
  var bannerimages=[].obs;
  var categories = <Map<String, dynamic>>[].obs;
  var subcategories = <Map<String, dynamic>>[].obs;
  int selected_banner = 0;
  Rx<GetAboutUs?> aboutUs = Rx<GetAboutUs?>(null);

  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Future.microtask(() {
      // get_product();
      requestAndroidNotificationPermission();
      get_category();
      get_banners();
      get_aboutdata();
    });
  }

  Future<void> requestAndroidNotificationPermission() async {
    // Check if we already have permission
    PermissionStatus status = await Permission.notification.status;

    if (status.isDenied || status.isRestricted) {
      // Request permission if it's denied or restricted
      PermissionStatus newStatus = await Permission.notification.request();

      if (newStatus.isGranted) {
        print("Notification permission granted");
      } else {
        print("Notification permission denied");
      }
    } else {
      print("Notification permission already granted");
    }
  }
  get_banners() async {
    try{
      Response response=await Baseprovider().hitget(url: getBanner);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.body["status"]==true){
          GetBannerModel bannerdata=GetBannerModel.fromJson(response.body);
          bannerimages.value = bannerdata.data!.map((banner) => banner.image).toList();
          print("all images --> $bannerimages");
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
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
          aboutUs.value=productdata;
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }

  get_category() async {
    try {
      // Fetch the response using your GET request method
      Response response = await Baseprovider().hitget(url: categories_endpoint);
      print('Response: ${response.body}');

      // Check if the response has an error
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        // Check if the response contains a success status
        if (response.body["status"] == true) {
          // Safely extract and process the categories data
          List<dynamic> data = response.body["data"];

          // Map the response to extract id and name for each category
          categories.value = data.map((item) {
            return {
              'id': item['id'],
              'name': item['name'],
            };
          }).toList(); // This is a List<Map<String, dynamic>>

          // Save the processed categories to Shared Preferences
          await SharedUtils().saveCategoriesData(categories);

          // Print the final list of categories for verification
          print("All categories --> $categories");
        } else {
          print('Failed to fetch categories: ${response.body["message"]}');
          failed_toast(response.body["message"].toString());
        }
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      failed_toast('An error occurred while fetching categories.');
    }
  }

}