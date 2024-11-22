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
          key: controller.formKey,
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
                height: 5.h,
              ),
              const Text(
                signin,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                  hinttext: enter_email,
                  fieldcontroller: controller.emailcontroller,
                  prefix: CommonImageWidget(
                    imageSourceType: ImageSourceType.svg,
                    imageUrl: '${images_baseurl}messageicon.svg',
                  ),
                  validator: (value) {
                    return emailValidator(value);
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
                    validator: (value) {
                      return passwordValidator(value);
                    });
              }),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(const Forgot_screen());
                      },
                      child: const Text(
                        forgot_password,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                ],
              ),
              SizedBox(height: 2.h),
              CommonbtnWidget(
                title: signin,
                onTap: () {
                  // if (controller.formKey.currentState!.validate()) {
                  Get.to(BottomNavScreen());
                  // }
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
