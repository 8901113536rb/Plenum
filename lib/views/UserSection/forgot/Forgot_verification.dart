import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/Appcolors.dart';
import '../../../constants/Stringconstants.dart';
import '../../../constants/Textstyles.dart';
import '../../../controllers/UserControllers/ForgotverificationController.dart';
import '../../../utils/CommonImageWidget.dart';
import '../../../utils/CommonValidations.dart';
import '../../../utils/CommonbtnWidget.dart';
import '../../../utils/Commonwidgets.dart';
import 'CreateNewPassword.dart';


class Forgotverification extends StatefulWidget {
  Forgotverification({Key? key}) : super(key: key);

  @override
  State<Forgotverification> createState() => _ForgotverificationState();
}

class _ForgotverificationState extends State<Forgotverification> {
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  ForgotverificationController controller=Get.put(ForgotverificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_bar(bgcolor: white,backbtn: true),
      body: body(),
    );
  }
  Widget body(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      height: double.infinity,
      width: double.infinity,
      child:Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Center(child: CommonImageWidget(imageSourceType: ImageSourceType.asset, imageUrl: '${images_baseurl}app_logo.png',height: 6.h,fit: BoxFit.fitHeight,)),
              SizedBox(height: 5.h,),
              Text(otp_verification,style: Common_textstyles.otpverificationtitlestyle,),
              SizedBox(height: 1.h,),
              Text(enter_the_verification_code,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: otpverificationdetailcolor),textAlign: TextAlign.center,),
              SizedBox(height: 4.h,),
              pin_input(),
              SizedBox(height: 30.h,),
              CommonbtnWidget(title: verify,onTap: (){
                if (formKey.currentState!.validate()) {
                  Get.to(Createnewpassword());
                } }),

            ],
          ),
        ),
      ),
    );
  }

  Widget pin_input(){
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: pinputborder),
      ),
    );

    return Directionality(
      // Specify direction if desired
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: 6,
        controller: controller.pinController,
        focusNode: focusNode,
        androidSmsAutofillMethod:
        AndroidSmsAutofillMethod.smsUserConsentApi,
        listenForMultipleSmsOnAndroid: true,
        defaultPinTheme: defaultPinTheme,
        separatorBuilder: (index) => const SizedBox(width: 15),
        validator: (value) {
          return otpValidator(value);  // Return null if valid
        },
        // onClipboardFound: (value) {
        //   debugPrint('onClipboardFound: $value');
        //   pinController.setText(value);
        // },
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: (pin) {
          debugPrint('onCompleted: $pin');
        },
        onChanged: (value) {
          debugPrint('onChanged: $value');
        },
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: Colors.black,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: themecolor),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
    );
  }

}
