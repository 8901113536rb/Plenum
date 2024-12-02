import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plenum/constants/Networkconstants.dart';
import 'package:sizer/sizer.dart';
import '../../constants/appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/AboutUsController.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/Commonwidgets.dart';
import '../../utils/NoDataFound.dart';

class Aboutusui extends StatefulWidget {
  const Aboutusui({super.key});

  @override
  State<Aboutusui> createState() => _AboutusuiState();
}

class _AboutusuiState extends State<Aboutusui> {
  Aboutuscontroller controller = Get.put(Aboutuscontroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      controller.get_aboutdata();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return SafeArea(
        child: Scaffold(
          //appBar: appBar(),
          body:
          Container(
              color: themecolor,
              child: Column(
                children: [
                  // Top Section with Title and Search Bar
                  Expanded(
                    flex:  0,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                },
                                  child: Icon(Icons.arrow_back,color: white,)),
                              SizedBox(width: 2.w,),
                              Text(
                                about_us,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Bottom Section with Dropdowns and Product List
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: controller.products.value?.data?.id.toString()!=""?
                      aboutusview():
                      const NoDataFound(message: no_data_found,),
                    ),
                  ),
                ],
              )
          )

        ),
      );
    });
  }
  Widget aboutusview(){
    return Padding(
      padding:  EdgeInsets.only(left: 6.0.w,right: 6.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 5.h,),
          Center(
            child: SizedBox(
              width: 40.w,
              height: 10.h,
              child: CommonImageWidget(
                imageSourceType: ImageSourceType.cached_image,
                imageUrl: controller.products.value?.data?.icon.toString()??"",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5.h,),
          Row(
            children: [
              Text(
                "$aboutname :-",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),
              SizedBox(width: 2.w,),
              Text(
                controller.products.value?.data?.title.toString()??'',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h,),
          Text(
            "$abouttxt :-",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: black,
            ),
          ),
          SizedBox(height: 1.5.h,),
          Text(
            controller.products.value?.data?.about.toString()??'',
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: black,
            ),
          ),
          SizedBox(height: 3.h,),
          Text(
            "$description :-",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: black,
            ),
          ),
          SizedBox(height: 1.5.h,),
          Text(
            controller.products.value?.data?.description.toString()??'',
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: black,
            ),
          ),
          SizedBox(width:2.w,),
        ],
      ),
    );
  }
}
