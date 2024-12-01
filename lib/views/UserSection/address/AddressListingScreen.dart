import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/Stringconstants.dart';
import '../../../constants/Textstyles.dart';
import '../../../constants/appcolors.dart';
import '../../../controllers/UserControllers/addresscontrollers/AddressListingController.dart';
import '../../../utils/CommonAppBarWidget.dart';
import '../../../utils/NoDataFound.dart';
import '../../../utils/Sharedutils.dart';
import 'AddAddressScreen.dart';
import 'UpdateAdressScreen.dart';

class Addresslistingscreen extends StatefulWidget {
  String? comesfrom;
  Addresslistingscreen({super.key,required this.comesfrom});


  @override
  State<Addresslistingscreen> createState() => _AddresslistingscreenState();
}

class _AddresslistingscreenState extends State<Addresslistingscreen> {
  Addresslistingcontroller controller=Get.put(Addresslistingcontroller());
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Get.to(Addaddressscreen());
            print("Message "+result.toString());
            if (result == 'addressAdded') {
              controller.get_all_address();
            }
          },
          child: Icon(Icons.add),
          backgroundColor: themecolor,
        ),
        appBar: const Commonappbarwidget(
          leftText: address,
          showBackArrow: true,
        ),
        body: controller.addressdata.isNotEmpty?addresslistview():const NoDataFound(message: no_data_found,),
      );
    });
  }
  Widget addresslistview(){
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 2.h),
        itemCount: controller.addressdata.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            // height: 21.5.h,
            margin: EdgeInsets.only(left: 3.w,right: 3.w,top: 2.h),
            decoration: new BoxDecoration(
              color: boxcolor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  blurRadius: 20.0, // Soften the shadow
                  spreadRadius: 0.0, // Extend the shadow
                  offset: Offset(
                    5.0, // Move right 5 horizontally
                    5.0, // Move down 5 vertically
                  ),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 4.w,right: 4.w,top: 2.h,bottom: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(controller.addressdata[index].houseNumber.toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: blackcolor),),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () async{
                                final result =  await Get.to(Updateadressscreen(
                                  houseno:controller.addressdata[index].houseNumber.toString(),
                                  city:controller.addressdata[index].city.toString(),
                                  state:controller.addressdata[index].state.toString(),
                                  street:controller.addressdata[index].street.toString(),
                                  postalcode:controller.addressdata[index].pincode.toString(),
                                  landmark:controller.addressdata[index].landmark.toString(),
                                  id:controller.addressdata[index].id.toString(),
                                ));
                                if (result == 'addressUpdated') {
                                  controller.get_all_address(); // Fetch the address list again
                                }
                              },
                              child: Icon(Icons.edit_outlined,color:Colors.black ,)),
                          SizedBox(width: 3.w,),
                          GestureDetector(
                              onTap: (){
                                controller.delete_address(controller.addressdata[index].id!.toInt());
                              },
                              child: Icon(Icons.delete_outline_outlined,color:ordercncl_color ,)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  SizedBox(width:50.w,child: Text(controller.addressdata[index].street.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: blackcolor,overflow: TextOverflow.ellipsis))),
                  SizedBox(height: 1.h,),
                  SizedBox(width:50.w,child: Text(controller.addressdata[index].city.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: blackcolor,overflow: TextOverflow.ellipsis))),
                  SizedBox(height: 1.h,),
                  widget.comesfrom=="Placeorder"?
                  InkWell(
                    onTap: () {
                      setState(() async {
                        controller.selectedAddressIndex.value = index;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<int>(
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value: index,
                          groupValue: controller.selectedAddressIndex.value, // Selected value
                          onChanged: (int? value) {
                            setState(() {
                              controller.selectedAddressIndex.value = value!;
                              print(controller.selectedAddressIndex.value.toString());
                              if(widget.comesfrom=="Placeorder"){
                                String userdetails=jsonEncode(controller.addressdata.elementAt(index));
                                SharedUtils().save_address_data(userdetails);
                                Get.back(result: controller.addressdata[index]);
                              }else{
                                String userdetails=jsonEncode(controller.addressdata.elementAt(index));
                                SharedUtils().save_address_data(userdetails);
                              }
                            });
                          },
                          activeColor: themecolor,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          default_address,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: blackcolor,
                          ),
                        ),
                      ],
                    ),
                  ):SizedBox()
                ],
              ),
            ),
          );
        });
  }

}
