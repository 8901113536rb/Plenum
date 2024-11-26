import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/Stringconstants.dart';
import '../../../constants/Textstyles.dart';
import '../../../constants/appcolors.dart';
import '../../../controllers/UserControllers/addresscontrollers/AddressListingController.dart';
import '../../../utils/CommonAppBarWidget.dart';
import 'AddAddressScreen.dart';
import 'UpdateAdressScreen.dart';

class Addresslistingscreen extends StatefulWidget {
   Addresslistingscreen({super.key});

  @override
  State<Addresslistingscreen> createState() => _AddresslistingscreenState();
}

class _AddresslistingscreenState extends State<Addresslistingscreen> {
  Addresslistingcontroller controller=Get.put(Addresslistingcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
             await Get.to(Addaddressscreen());
          },
          child: Icon(Icons.add),
          backgroundColor: themecolor,
        ),
      appBar: const Commonappbarwidget(
        leftText: address,
        showBackArrow: true,
      ),
        body: addresslistview(),
      );
  }
  Widget addresslistview(){
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 2.h),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            // height: 21.5.h,
            margin: EdgeInsets.only(left: 3.w,right: 3.w,top: 2.h),
            decoration: new BoxDecoration(
              color: boxcolor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.2),
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
              padding: EdgeInsets.only(left: 4.w,right: 4.w,top: 2.h,bottom: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Mohali",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: blackcolor),),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: (){
                               Get.to(Updateadressscreen());
                              },
                              child: Icon(Icons.edit_outlined,color:Colors.black ,)),
                          SizedBox(width: 3.w,),
                          GestureDetector(
                              onTap: (){
                                controller.delete_address(6);
                              },
                              child: Icon(Icons.delete_outline_outlined,color:ordercncl_color ,)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  SizedBox(width:50.w,child: Text("1469",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: blackcolor,overflow: TextOverflow.ellipsis))),
                  SizedBox(height: 1.h,),
                  SizedBox(width:50.w,child: Text("phase 5",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: blackcolor,overflow: TextOverflow.ellipsis))),
                  SizedBox(height: 1.h,),
                  InkWell(
                    onTap: () {
                      setState(() async {
                        controller.selectedAddressIndex.value = index;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<int>(
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: index,
                          groupValue: controller.selectedAddressIndex.value, // Selected value
                          onChanged: (int? value) {
                          },
                          activeColor: themecolor,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          default_address,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: blackcolor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

}
