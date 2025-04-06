import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plenum/views/UserSection/BottomNavUi.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/SigninController.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonValidations.dart';
import '../../utils/CommonbtnWidget.dart';
import '../../utils/Commonformfield.dart';
import 'SignupScreen.dart';
import 'forgot/Forgot_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  SigninController controller = Get.put(SigninController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body(),
      ),
    );
  }

  Widget body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Center(
                  child: CommonImageWidget(
                imageSourceType: ImageSourceType.asset,
                imageUrl: '${images_baseurl}app_logo.png',
                height: 6.h,
                fit: BoxFit.fitHeight,
              )),
              SizedBox(
                height: 15.h,
              ),
              const Text(
                signin,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                keyboardtype: TextInputType.number,
                  hinttext: enter_phonenumber,
                  fieldcontroller: controller.emailcontroller,
                  prefix: CommonImageWidget(
                    imageSourceType: ImageSourceType.svg,
                    imageUrl: '${images_baseurl}phoneicon.svg',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    } else if (!RegExp(r'^(?:\+91|91|0)?[6-9]\d{9}$').hasMatch(value)) {
                      return 'Enter valid phone number';
                    }
                    return null;
                  }),
              SizedBox(height: 2.h),
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
                    prefix: CommonImageWidget(
                      imageSourceType: ImageSourceType.svg,
                      imageUrl: "${images_baseurl}lockicon.svg",
                    ),
                    // validator: (value) {
                    //   return passwordValidator(value);
                    // }
                );
              }),
              SizedBox(height: 2.h),
              SizedBox(height: 2.h),
              CommonbtnWidget(
                title: signin,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    controller.signin_user();
                  }
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const SignupScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      dont_have_an_account,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      sign_up,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: singupcolor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
