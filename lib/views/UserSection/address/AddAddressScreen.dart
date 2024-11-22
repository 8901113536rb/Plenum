import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/Appcolors.dart';
import '../../../constants/Stringconstants.dart';
import '../../../controllers/UserControllers/addresscontrollers/AddAddressController.dart';
import '../../../utils/CommonAppBarWidget.dart';
import '../../../utils/CommonValidations.dart';
import '../../../utils/CommonbtnWidget.dart';
import '../../../utils/Commonformfield.dart';

class Addaddressscreen extends StatefulWidget {
  const Addaddressscreen({super.key});

  @override
  State<Addaddressscreen> createState() => _AddaddressscreenState();
}

class _AddaddressscreenState extends State<Addaddressscreen> {
  Addaddresscontroller controller=Get.put(Addaddresscontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Commonappbarwidget(
        leftText: add_address,
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
                  validator: (value){
                    return  txtValidator(value,please_address_line);
                  }
              ),
              SizedBox(
                  height:2.h
              ),
              Commonformfield(
                  hinttext: city_txt,
                  fieldcontroller: controller.citycontroller,
                  validator: (value){
                    return  txtValidator(value,please_city_txt);
                  }
              ),
              SizedBox(
                  height:2.h
              ),
              Commonformfield(
                  hinttext: state_txt,
                  fieldcontroller: controller.statecontroller,
                  validator: (value){
                    return  txtValidator(value,please_state_txt);
                  }
              ),
              SizedBox(
                  height:2.h
              ),
              Commonformfield(
                keyboardtype: TextInputType.number,
                  hinttext: postal_code,
                  fieldcontroller: controller.postalcodecontroller,
                  validator: (value){
                    return  txtValidator(value,please_postal_code);
                  }
              ),
              SizedBox(
                  height:2.h
              ),
              Commonformfield(
                  hinttext: country_txt,
                  fieldcontroller: controller.countrycontroller,
                  validator: (value){
                    return  txtValidator(value,please_country_txt);
                  }
              ),
              SizedBox(
                  height:5.h
              ),
              CommonbtnWidget(
                title: "+ $add_address",
                onTap: (){
                if (controller.formKey.currentState!.validate()) {
                Get.back();
                }
              },),
            ],
          ),
        ),
      ),
    );
  }
}
