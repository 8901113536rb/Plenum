import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Stringconstants.dart';
import '../../constants/appcolors.dart';
import '../../controllers/NotificationController.dart';
import '../../utils/CommonAppBarWidget.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/NoDataFound.dart';

class Notificationui extends StatefulWidget {
  const Notificationui({super.key});

  @override
  State<Notificationui> createState() => _NotificationuiState();
}

class _NotificationuiState extends State<Notificationui> {
  Notificationcontroller controller = Get.put(Notificationcontroller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      controller.get_notification();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        backgroundColor: screenbgcolor,
        appBar: const Commonappbarwidget(
          leftText: notifications,
          showBackArrow: true,


        ),
        body: controller.notificationdata.isNotEmpty?notificationView():const NoDataFound(message: no_data_found,),
      );
    });
  }
  Widget notificationView(){
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 2.h),
        itemCount: controller.notificationdata.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            // height: 21.5.h,
            margin: EdgeInsets.only(left: 3.w,right: 3.w,top: 2.h),
            decoration: new BoxDecoration(
              color: boxcolor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.4),
                  blurRadius: 20.0, // Soften the shadow
                  spreadRadius: 0.0, // Extend the shadow
                  offset: Offset(
                    5.0, // Move right 5 horizontally
                    5.0, // Move down 5 vertically
                  ),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 3.w,right: 3.w,top: 1.5.h,bottom: 1.5.h),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.notificationdata[index].title.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: black),),
                  SizedBox(height: 0.6.h,),
                  Text(controller.notificationdata[index].description.toString(),maxLines: 2,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: black,overflow: TextOverflow.ellipsis)),
                  SizedBox(height: 0.6.h,),
                  Row(
                    children: [
                      Text("Create: ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: black)),
                      Text(controller.formatDateTime(controller.notificationdata[index].createdAt.toString()),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: black)),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
