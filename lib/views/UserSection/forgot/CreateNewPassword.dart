import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/Appcolors.dart';
import '../../../constants/Stringconstants.dart';
import '../../../constants/Textstyles.dart';
import '../../../controllers/UserControllers/Createnewpassword_controller.dart';
import '../../../utils/CommonValidations.dart';
import '../../../utils/CommonbtnWidget.dart';
import '../../../utils/Commonformfield.dart';
import '../../../utils/Commonwidgets.dart';
import '../SigninScreen.dart';

class Createnewpassword extends StatefulWidget {
  Createnewpassword({super.key});

  @override
  State<Createnewpassword> createState() => _CreatenewpasswordState();
}

class _CreatenewpasswordState extends State<Createnewpassword> {
  Createnewpassword_controller controller=Get.put(Createnewpassword_controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_bar(bgcolor: white, backbtn: true),
      body:Obx((){
        return  Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child:  Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 3.h,),
                  Text(create_new_password,style: Common_textstyles.otpverificationtitlestyle,),
                  SizedBox(height: 3.h,),
                  Text(your_new_password_must_unique,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: otpverificationdetailcolor),textAlign: TextAlign.center,),
                  SizedBox(height: 5.h,),
                  Commonformfield(
                    hinttext: new_password,
                    fieldcontroller: controller.newpassword_controller,
                    obscuretxt: controller.newObscured.value,
                    suffix: IconButton(
                      splashColor: Colors.transparent,
                      icon: Icon(controller.newObscured.value
                          ? Icons.visibility_off
                          : Icons.visibility,color: themecolor,),
                      onPressed: () {
                        controller.toggleNewPasswordVisibility();
                      },
                    ),
                    validator: (value) {
                      return passwordValidator(value);
                    },
                  ),
                  SizedBox(height: 2.h,),
                  Commonformfield(
                    hinttext: confirm_password,
                    fieldcontroller: controller.confirmpassword_controller,
                    obscuretxt: controller.confirmObscured.value,
                    suffix: IconButton(
                        splashColor: Colors.transparent,
                        icon: Icon(controller.confirmObscured.value
                            ? Icons.visibility_off
                            : Icons.visibility,color: themecolor,),
                        onPressed: () {
                          controller.toggleConfirmPasswordVisibility();
                        }),
                    validator: (value) {
                      return confirmPasswordValidator(value,controller.newpassword_controller);
                    },
                  ),
                  SizedBox(height: 20.h,),
                  CommonbtnWidget(title: reset_password,onTap: (){
                    if (controller.formKey.currentState!.validate()) {
                      Get.offAll( const SigninScreen());
                    }
                  },)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
