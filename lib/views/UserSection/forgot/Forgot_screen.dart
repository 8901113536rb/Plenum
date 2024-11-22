import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/Appcolors.dart';
import '../../../constants/Stringconstants.dart';
import '../../../constants/Textstyles.dart';
import '../../../controllers/UserControllers/ForgotController.dart';
import '../../../utils/CommonValidations.dart';
import '../../../utils/CommonbtnWidget.dart';
import '../../../utils/Commonformfield.dart';
import '../../../utils/Commonwidgets.dart';
import 'Forgot_verification.dart';

class Forgot_screen extends StatefulWidget {
  const Forgot_screen({Key? key}) : super(key: key);

  @override
  State<Forgot_screen> createState() => _Forgot_screenState();
}

class _Forgot_screenState extends State<Forgot_screen> {
  ForgotController controller = Get.put(ForgotController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_bar(bgcolor: white, backbtn: true),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding:
        EdgeInsets.only(left: 3.w, right: 3.w),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  forgot_password,
                  style: Common_textstyles.otpverificationtitlestyle,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  dont_worry_enter_email,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: otpverificationdetailcolor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Commonformfield(
                  hinttext: enter_your_email,
                  fieldcontroller: controller.emailcontroller,
                  validator: (value) {
                    return emailValidator(value);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommonbtnWidget(
                    title: find_your_account,
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        Get.to( Forgotverification());
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
