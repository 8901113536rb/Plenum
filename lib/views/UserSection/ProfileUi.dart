import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Appcolors.dart';
import '../../constants/Stringconstants.dart';
import '../../constants/Textstyles.dart';
import '../../controllers/UserControllers/ProfileController.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonValidations.dart';
import '../../utils/CommonbtnWidget.dart';
import '../../utils/Commonformfield.dart';

class Profileui extends StatefulWidget {
  const Profileui({Key? key}) : super(key: key);

  @override
  State<Profileui> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<Profileui> {
  Profilecontroller controller = Get.put(Profilecontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          color: white,
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CommonbtnWidget(
            title: update_profile,
            onTap: () {
              print(controller.profileimage);
              if (controller.formKey.currentState!.validate()) {
              }
            },
          ),
        ),
        // appBar: App_bar(),
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
                      setup_your_profile,
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
                        child: body())),
              ],
            )),
      ),
    );
  }

  Widget body() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Center(
                child: Stack(
                  children: [
                    // Profile picture (avatar)
                    Obx(() {
                      return CircleAvatar(
                        radius: 50,
                        backgroundImage: controller.profileimage.value != null
                            ? FileImage(controller.profileimage.value!)
                            : controller.selectedImage.value.isNotEmpty
                                ? NetworkImage(images_baseurl +
                                    controller.selectedImage.value)
                                : const AssetImage(
                                    "assets/images/profilepic.png"), // Default avatar
                      );
                    }),
                    // Edit pencil icon
                    // https://himachaliapples.com/storage/app/profile_images/Eu9ieuWw3E10og4hT9t1A20p2bwoZWCw4vgFsxZ0.png
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          controller.showPicker(
                              context); // Trigger image picker on tap
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                themecolor, // Background color of the edit icon
                          ),
                          padding: EdgeInsets.all(6),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 22, // Size of the edit icon
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // CommonImageWidget(imageSourceType: ImageSourceType.asset, imageUrl: images_baseurl+"profilepic.png",height: 12.h,fit: BoxFit.fill,),
              // Text(upload_image,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color:singupcolor),),
              SizedBox(
                height: 3.h,
              ),
              Commonformfield(
                hinttext: first_name,
                fieldcontroller: controller.firstnameController,
                validator: (value) {
                  return nameValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: last_name,
                fieldcontroller: controller.lastnameController,
                validator: (value) {
                  return nameValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: email_address,
                fieldcontroller: controller.emailController,
                validator: (value) {
                  return emailValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                keyboardtype: TextInputType.number,
                hinttext: phonenumber,
                fieldcontroller: controller.phonenumberController,
                validator: (value) {
                  return phoneNumberValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(() {
                return Commonformfield(
                    hinttext: enter_password,
                    fieldcontroller: controller.passwordcontroller,
                    obscuretxt: controller.isObscured.value,
                    suffix: IconButton(
                      splashColor: Colors.transparent,
                      icon: Icon(controller.isObscured.value
                          ? Icons.visibility_off
                          : Icons.visibility,color: themecolor,),
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                    ),
                    // prefix: CommonImageWidget(
                    //   imageSourceType: ImageSourceType.svg,
                    //   imageUrl: "${images_baseurl}lockicon.svg",
                    // ),
                    validator: (value) {
                      return passwordValidator(value);
                    });
              }),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
