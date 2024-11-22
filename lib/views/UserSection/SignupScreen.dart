import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/SignupController.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonValidations.dart';
import '../../utils/CommonbtnWidget.dart';
import '../../utils/Commonformfield.dart';
import 'SigninScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupController controller=Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_sharp,color:Colors.black,)),
        backgroundColor: white,
      ),
      body:body(),
    );
  }
  Widget body(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Center(child: CommonImageWidget(imageSourceType: ImageSourceType.asset, imageUrl: images_baseurl+'app_logo.png',height: 6.h,fit: BoxFit.fitHeight,)),
              SizedBox(height: 5.h,),
              Text(sign_up,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,),),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: first_name,
                fieldcontroller: controller.firstname_controller,
                prefix:CommonImageWidget(imageSourceType: ImageSourceType.svg,
                  imageUrl: "${images_baseurl}usericon.svg",),
                validator: (value) {
                  return nameValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: last_name,
                fieldcontroller: controller.lastname_controller,
                prefix:CommonImageWidget(imageSourceType: ImageSourceType.svg,
                  imageUrl: "${images_baseurl}usericon.svg",),
                validator: (value) {
                  return nameValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                hinttext: enter_your_email,
                fieldcontroller: controller.email_controller,
                prefix:CommonImageWidget(imageSourceType: ImageSourceType.svg,
                    imageUrl: "${images_baseurl}messageicon.svg" ),
                validator: (value) {
                  return emailValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Commonformfield(
                keyboardtype: TextInputType.number,
                hinttext: "000-000-0000",
                fieldcontroller: controller.phone_controller,
                prefix:CommonImageWidget(imageSourceType: ImageSourceType.svg,
                    imageUrl: "${images_baseurl}phoneicon.svg" ),
                validator: (value) {
                  return phoneNumberValidator(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
             Obx((){
               return  Commonformfield(
                 obscuretxt: controller.yourpasswordObscured.value,
                 hinttext: password_txt,
                 fieldcontroller: controller.password_controller,
                 suffix: IconButton(
                   splashColor: Colors.transparent,
                   icon: Icon(controller.yourpasswordObscured.value
                       ? Icons.visibility_off
                       : Icons.visibility,color: themecolor,),
                   onPressed: () {
                     controller.yourPasswordVisibility();
                   },
                 ),
                 prefix:CommonImageWidget(imageSourceType: ImageSourceType.svg,
                     imageUrl: "${images_baseurl}lockicon.svg" ),
                 validator: (value) {
                   return passwordValidator(value);
                 },
               );
             }),
              SizedBox(
                height: 5.h,
              ),
              CommonbtnWidget(title: sign_up,onTap: (){
                if (controller.formKey.currentState!.validate()) {
                  // controller.signup_user();
                }
              }),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: (){
                  Get.to(SigninScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(already_have_an_account,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,),),
                    const SizedBox(width: 5,),
                    Text(signin,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: singupcolor),),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
