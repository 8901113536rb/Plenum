import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../constants/stringconstants.dart';
import '../utils/CommonImageWidget.dart';
import '../utils/Sharedutils.dart';
import 'UserSection/BottomNavUi.dart';
import 'UserSection/SigninScreen.dart';

class SplashScreen extends StatefulWidget {
  // const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;

  @override
  void initState() {
    super.initState();
    gettoken();
  }
  Future<void> gettoken() async {
    token=await SharedUtils().get_token();
    print("User token:-$token");
    Future.delayed(const Duration(seconds: 3),(){
      if(token==null){
        Get.offAll(SigninScreen());
      }else{
          Get.offAll(BottomNavScreen());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CommonImageWidget(imageSourceType: ImageSourceType.asset, imageUrl: '${images_baseurl}app_logo.png',width: 45.w,fit: BoxFit.fill,),
      ),
    );
  }
}
