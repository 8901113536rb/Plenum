import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

import '../../constants/Stringconstants.dart';
import 'BottomNavUi.dart';

class PlaceordersuccessScreen extends StatefulWidget {
  PlaceordersuccessScreen({super.key});

  @override
  State<PlaceordersuccessScreen> createState() => _PlaceordersuccessScreenState();
}

class _PlaceordersuccessScreenState extends State<PlaceordersuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 4.w,right: 4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(images_baseurl+"order_place.svg",width: 30.w,),
            SizedBox(
              height: 2.h,
            ),
            const Text(place_order_dummy_txt,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
            SizedBox(
              height: 8.h,
            ),
            GestureDetector(
              onTap: (){
              Get.offAll(BottomNavScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                padding: EdgeInsets.only(left: 7.w,right: 7.w,top: 2.h,bottom: 2.h),
                child: Text("Back to Home",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),),
              ),
            )
          ],
        ),
      ),

    );
  }
}
