
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plenum/views/UserSection/ProfileUi.dart';
import 'package:plenum/views/UserSection/SigninScreen.dart';
import 'package:plenum/views/UserSection/address/AddressListingScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../constants/Appcolors.dart';
import '../../constants/Networkconstants.dart';
import '../../constants/Stringconstants.dart';
import '../../controllers/UserControllers/MyProfileController.dart';
import '../../utils/Commonwidgets.dart';
import '../../utils/Sharedutils.dart';

class Myprofilescreen extends StatefulWidget {
  const Myprofilescreen({Key? key}) : super(key: key);

  @override
  State<Myprofilescreen> createState() => _Profile_screenState();
}

class _Profile_screenState extends State<Myprofilescreen> {
  Myprofilecontroller controller=Get.put(Myprofilecontroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getuserdetails();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Obx((){
        return Scaffold(
          // backgroundColor: screenbgcolor,
          // appBar: App_bar(title:profile,backbtn: false),
          body: Container(
            color: themecolor,
            child: Column(
              children: [
                Expanded(
                  flex:  0,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Text(
                      profile,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),

                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        profile_picture(),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text("${controller.first_name.value} ${controller.last_name.value}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: black),),
                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                            highlightColor: screenbgcolor,
                            splashColor: screenbgcolor,
                            onTap: (){
                              Get.to(Profileui());
                            },
                            child: profile_items(yourprofile,"profile_icon.svg",)),
                        InkWell(
                            highlightColor: screenbgcolor,
                            splashColor: screenbgcolor,
                            onTap: (){
                              Get.to(Addresslistingscreen());
                            },
                            child: profile_items(delivery_address,"deliveryaddress.svg",)),
                        InkWell(
                            highlightColor: screenbgcolor,
                            splashColor: screenbgcolor,
                            onTap: ()  async {
                              await SharedUtils().cleardata();
                              Get.offAll(const SigninScreen());
                            },
                            child: profile_items(logout,"setting_icon.svg",divider: false)),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );

  }
  Widget profile_picture(){
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Obx(() {
          return CircleAvatar(
            radius: 45,
            backgroundImage: controller.profile_image.isNotEmpty
                ? NetworkImage(vhImageBaseUrl + controller.profile_image.value)
                : const AssetImage(images_baseurl+"profilepic.png"), // Default avatar
          );
        }),
      ],
    );
  }

  Widget profile_items(String title,String icon, {bool? divider = true}){
    return Column(
      children: [
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
                width: 15.w,
                child: SvgPicture.asset(images_baseurl+"$icon",color: itemdesccolor,)),
            Container(
              alignment: Alignment.centerLeft,
                width: 70.w,
                child: Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
           Icon(Icons.chevron_right)
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        if(divider==true)
        Divider()
      ],
    );
  }
}
