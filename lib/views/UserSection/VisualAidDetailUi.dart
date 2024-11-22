import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/Appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/VisualAidDetailControllelr.dart';
import 'VisualAidViewUi.dart';

class Visualaiddetailui extends StatefulWidget {
  @override
  _VisualaiddetailuiState createState() => _VisualaiddetailuiState();
}

class _VisualaiddetailuiState extends State<Visualaiddetailui> {
  Visualaiddetailcontrollelr controller=Get.put(Visualaiddetailcontrollelr());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        backgroundColor:black,
        body: imageView(),
      bottomSheet: bottomSheetView(),
      );
    });
  }
  imageView(){
    return Column(
      children: [
        SizedBox(height: 8.h,),
        Center(
          child: Text(
            '${controller.currentIndex.value + 1}/${controller.imageUrls.length}',
            style:  TextStyle(
              color: white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 6.h,),
        Padding(
          padding:  EdgeInsets.only(left: 4.0.w,right: 4.w),
          child: CarouselSlider.builder(
            itemCount: controller.imageUrls.length,
            itemBuilder: (context, index, realIndex) {
              return Image.asset(
                images_baseurl+controller.imageUrls[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
            options: CarouselOptions(
              height: 65.h,
              enlargeCenterPage: true,
              autoPlay: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                controller.currentIndex.value = index;
              },
            ),
          ),
        ),
      ],
    );
  }
  bottomSheetView(){
    return Container(
      color: white,
      height: 6.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
              child: Text(close,style: TextStyle(color: themecolor,fontSize: 16,fontWeight: FontWeight.bold),)),
          SizedBox(width: 20.w,),
          GestureDetector(
            onTap: (){
              Get.to(Visualaidviewui());
            },
              child: Text(view,style: TextStyle(color: themecolor,fontSize: 16,fontWeight: FontWeight.bold),)),
        ],
      ),
    );
  }
}


