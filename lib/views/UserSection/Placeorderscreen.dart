import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Appcolors.dart';
import '../../constants/Stringconstants.dart';
import '../../constants/Textstyles.dart';
import '../../controllers/UserControllers/Placeordercontroller.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonbtnWidget.dart';
import 'PlaceOrderSuccess_screen.dart';
import 'address/AddressListingScreen.dart';

class Placeorderscreen extends StatefulWidget {
  @override
  State<Placeorderscreen> createState() => _PlaceorderscreenState();
}

class _PlaceorderscreenState extends State<Placeorderscreen> {
  Placeordercontroller controller = Get.put(Placeordercontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(26.h), // Set this height
            child: appbarView()),
        bottomNavigationBar:  Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.5.h),
      height: 7.h, // Adjust height to fit both buttons
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showOrderConfirmationDialog(context);
            },
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 15.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: themecolor,
              ),
              height: 6.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(Icons.share,color: white,size: 18,),
                  // SizedBox(width: 1.w,),
                  Text(
                    confirm_order,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
        body: productsView(),
      ),
    );
  }

  Widget productsView() {
    return Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Container(
          width: double.infinity,
          // height: 21.5.h,
          margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
          decoration:  BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 0.0, //extend the shadow
                offset: Offset(
                  5.0, // Move to right 10  horizontally
                  5.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: Padding(
            padding:
            EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h, bottom: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //     width: 12.h,
                //     height: 10.h,
                //     child: Image.asset(images_baseurl + "appledummy.png")),
                Container(
                  width: 10.h,
                  height: 8.h,
                  child: CommonImageWidget(imageSourceType: ImageSourceType.asset, imageUrl: images_baseurl+"dummy_image.png".toString(),fit: BoxFit.fill,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ALBINO -| Tab",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                    SizedBox(
                      height: 0.3.h,
                    ),
                    SizedBox(
                        width: 60.w,
                        child: Text(
                           "hdh hdndh uisks yuucjh hydhndch ujdhd udjd ujdjdjd djjdjd",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: create_acc_color,
                                overflow: TextOverflow.ellipsis))),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                        "$currency ${25}" ??
                            '',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: blackcolor)),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          // height: 21.5.h,
          margin: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
          decoration:  BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 0.0, //extend the shadow
                offset: Offset(
                  5.0, // Move to right 10  horizontally
                  5.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          child: Padding(
            padding:
            EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h, bottom: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(mrp_total,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text(
                      "$currency ${30}" ??
                          '',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("GST",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text(
                      "$currency ${40}" ??
                          '',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Service_Charges,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text(
                      "$currency ${400}" ??
                          '',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(total_tax,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text(
                      "$currency ${10}" ??
                          '',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: blackcolor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.3.h,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(total_amountstr,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: create_acc_color,
                            overflow: TextOverflow.ellipsis)),
                    Text(
                      "$currency ${5000}" ??
                          '',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ordercmpt_color),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.3.h,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),

      ],
    );
  }

  Widget appbarView() {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        color: themecolor,
        padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // GestureDetector(
                //   onTap: () {
                //     Get.back();
                //   },
                //   child: Icon(
                //     Icons.arrow_back,
                //     size: 25,
                //     color: white,
                //   ),
                // ),
                // SizedBox(
                //   width: 5.w,
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Confirmation,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              // height: 20.h,
              width: double.infinity,
              decoration:
              BoxDecoration(color: white, border: Border.all(color: white)),
              padding:
              EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h, bottom: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        total_price,
                        style: Common_textstyles.descTextstyle,
                      ),
                      Text("Free delivery",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: ordercmpt_color)),
                    ],
                  ),
                  SizedBox(
                    height: 0.4.h,
                  ),
                  Text(
                      "${currency}30",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: blackcolor)),
                  SizedBox(
                    height: 0.4.h,
                  ),

                  SizedBox(
                    height: 0.4.h,),
                  SizedBox(
                    height:1.h,
                  ),
                  Text(
                    delivery_address,
                    style: Common_textstyles.descTextstyle,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 70.w,
                        child: Text("${1469},${"Mohali"},${"Punjab"}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: blackcolor)),
                      ),
                      GestureDetector(
                        onTap: ()  {
                       Get.to(Addresslistingscreen());
                        },
                        child: Icon(
                          Icons.edit,
                          color: itemdesccolor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showOrderConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(20),
          title: Text(order_confirmation),
          content: Text(do_you_want_place_order),
          actions: <Widget>[
            TextButton(
              child: Text(Dismiss,style: TextStyle(color: themecolor),),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              child: Text(
                yes_place_order,
                style: Common_textstyles.checkoutTextStyle,
              ),
              onPressed: () {
              Get.to(PlaceordersuccessScreen());
              },
            ),
          ],
        );
      },
    );
  }
}
