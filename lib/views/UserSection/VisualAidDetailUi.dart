import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/Appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/VisualAidDetailControllelr.dart';
import '../../utils/CommonImageWidget.dart';
import 'VisualAidViewUi.dart';

class Visualaiddetailui extends StatefulWidget {
  final List<String> productsimage;

  Visualaiddetailui({required this.productsimage});
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
            '${controller.currentIndex.value + 1}/${widget.productsimage.length}',
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
            itemCount: widget.productsimage.length,
            itemBuilder: (context, index, realIndex) {
              return CommonImageWidget(
                imageSourceType: ImageSourceType.cached_image,
                imageUrl: widget.productsimage[index],
                fit: BoxFit.cover,
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


