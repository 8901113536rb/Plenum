import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/Appcolors.dart';
import '../../../constants/stringconstants.dart';
import '../../../controllers/UserControllers/addresscontrollers/UpdateAddressController.dart';
import '../../../utils/CommonAppBarWidget.dart';
import '../../../utils/CommonValidations.dart';
import '../../../utils/CommonbtnWidget.dart';
import '../../../utils/Commonformfield.dart';

class Updateadressscreen extends StatefulWidget {
  String houseno;
  String city;
  String state;
  String street;
  String postalcode;
  String landmark;
  String id;
  Updateadressscreen({super.key,
    required this.houseno,
    required this.city,
    required this.state,
    required this.street,
    required this.postalcode,
    required this.landmark,
    required this.id
  });

  @override
  State<Updateadressscreen> createState() => _UpdateadressscreenState();
}

class _UpdateadressscreenState extends State<Updateadressscreen> {
  Updateaddresscontroller controller = Get.put(Updateaddresscontroller());
  @override
  void initState() {
    super.initState();
    controller.housenocontroller = TextEditingController(text: widget.houseno);
    controller.citycontroller = TextEditingController(text: widget.city);
    controller.statecontroller = TextEditingController(text: widget.state);
    controller.pincodecodecontroller = TextEditingController(text: widget.postalcode);
    controller.streetcontroller = TextEditingController(text: widget.street);
    controller.landmarkcontroller = TextEditingController(text: widget.landmark);
  }

  @override
  void dispose() {
    controller.housenocontroller.dispose();
    controller.citycontroller.dispose();
    controller.statecontroller.dispose();
    controller.pincodecodecontroller.dispose();
    controller.landmarkcontroller.dispose();
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
                  hinttext: houseno,
                  fieldcontroller: controller.housenocontroller,
                  validator: (value) {
                    return txtValidator(value, please_houseno);
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
                  hinttext: street_txt,
                  fieldcontroller: controller.streetcontroller,
                  validator: (value) {
                    return txtValidator(value, please_street_txt);
                  }),
              SizedBox(height: 2.h),
              Commonformfield(
                  keyboardtype: TextInputType.number,
                  hinttext: postal_code,
                  fieldcontroller: controller.pincodecodecontroller,
                  validator: (value) {
                    return txtValidator(value, please_postal_code);
                  }),
              SizedBox(height: 2.h),
              Commonformfield(
                  hinttext: landmark_txt,
                  fieldcontroller: controller.landmarkcontroller,
                  validator: (value){
                    return  txtValidator(value,please_Landmark_txt);
                  }
              ),
              SizedBox(height: 5.h),
              CommonbtnWidget(
                title: update_address,
                onTap: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.updateaddress_api(widget.id.toString());
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
