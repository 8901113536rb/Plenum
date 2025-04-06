import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plenum/utils/Commonwidgets.dart';
import 'package:plenum/views/UserSection/SigninScreen.dart';
import 'package:sizer/sizer.dart';

class SignupSuccess extends StatefulWidget {
  const SignupSuccess({super.key});

  @override
  State<SignupSuccess> createState() => _SignupSuccessState();
}

class _SignupSuccessState extends State<SignupSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("User Registered Successfully, Please Wait For Admin Approval",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),textAlign: TextAlign.center
              ,),
            SizedBox(
              height: 5.h,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: common_button("Back to Home",context,(){
                  Get.off(const SigninScreen());
                }))
          ],
        ),
      ),
    );
  }
}
