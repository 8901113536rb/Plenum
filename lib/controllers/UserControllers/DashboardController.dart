import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../models/GetBannerModel.dart';
import '../../utils/CommonToast.dart';


class Dashboardcontroller extends GetxController{
  final key = GlobalKey<ExpandableFabState>();
  RxDouble currentIndex=0.0.obs;
  var bannerimages=[].obs;
  int selected_banner = 0;
  // final List<String> imageList = [
  //   "dummy_image.png",
  //   "dummy_image.png",
  //   "dummy_image.png",
  // ].obs;
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Future.microtask(() {
      // get_product();
      // get_categories();
      get_banners();
    });
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
}