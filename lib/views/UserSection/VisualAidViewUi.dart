import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/Appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/VisualAidViewController.dart';
import '../../utils/CommonAppBarWidget.dart';
import '../../utils/CommonbtnWidget.dart';

class Visualaidviewui extends StatefulWidget {
  @override
  _VisualaidviewuiState createState() => _VisualaidviewuiState();
}

class _VisualaidviewuiState extends State<Visualaidviewui> {
  Visualaidviewcontroller controller=Get.put(Visualaidviewcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Commonappbarwidget(
        leftText: visual_aid,
        showBackArrow: true,
      ),
      body: imageView(),
    );
  }
  imageView() {
    return Column(
      children: [
        SizedBox(height: 4.h),
        SizedBox(
          height: 65.h,
          child: Image.asset(
            "${images_baseurl}dummy_image.png",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ),
        SizedBox(height: 4.h),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 2.w,right: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: themecolor,
                  ),
                  height: 6.h,
                  width: double.infinity,
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share,color: white,size: 18,),
                      SizedBox(width: 2.w,),
                      Text(
                        share,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500, color: white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 2.w,),
              Expanded(
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 15.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: themecolor,
                  ),
                  height: 6.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download,color: white,size: 18,),
                      SizedBox(width: 2.w,),
                      Text(
                        downloads,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500, color: white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


