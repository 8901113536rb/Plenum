import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/Appcolors.dart';
import '../../../constants/Stringconstants.dart';
import '../../../controllers/UserControllers/addresscontrollers/UpdateAddressController.dart';
import '../../../utils/CommonAppBarWidget.dart';
import '../../../utils/CommonValidations.dart';
import '../../../utils/CommonbtnWidget.dart';
import '../../../utils/Commonformfield.dart';

class Updateadressscreen extends StatefulWidget {
  Updateadressscreen({
    super.key,
  });

  @override
  State<Updateadressscreen> createState() => _UpdateadressscreenState();
}

class _UpdateadressscreenState extends State<Updateadressscreen> {
  Updateaddresscontroller controller = Get.put(Updateaddresscontroller());
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.addresslinecontroller.dispose();
    controller.citycontroller.dispose();
    controller.statecontroller.dispose();
    controller.postalcodecontroller.dispose();
    controller.countrycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Commonappbarwidget(
        leftText: update_address,
        showBackArrow: true,
      ),
      body: body(),
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
                height: 2.h,
              ),
              Commonformfield(
                  hinttext: address_line,
                  fieldcontroller: controller.addresslinecontroller,
                  validator: (value) {
                    return txtValidator(value, please_address_line);
                  }),
              SizedBox(height: 2.h),
              Commonformfield(
                  hinttext: city_txt,
                  fieldcontroller: controller.citycontroller,
                  validator: (value) {
                    return txtValidator(value, please_city_txt);
                  }),
              SizedBox(height: 2.h),
              Commonformfield(
                  hinttext: state_txt,
                  fieldcontroller: controller.statecontroller,
                  validator: (value) {
                    return txtValidator(value, please_state_txt);
                  }),
              SizedBox(height: 2.h),
              Commonformfield(
                  keyboardtype: TextInputType.number,
                  hinttext: postal_code,
                  fieldcontroller: controller.postalcodecontroller,
                  validator: (value) {
                    return txtValidator(value, please_postal_code);
                  }),
              SizedBox(height: 2.h),
              Commonformfield(
                  hinttext: country_txt,
                  fieldcontroller: controller.countrycontroller,
                  validator: (value) {
                    return txtValidator(value, please_country_txt);
                  }),
              SizedBox(height: 5.h),
              CommonbtnWidget(
                title: update_address,
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}