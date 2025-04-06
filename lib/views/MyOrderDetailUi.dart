import 'dart:convert';
import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plenum/utils/CommonFunctions.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Appcolors.dart';
import '../../constants/Textstyles.dart';
import '../../constants/stringconstants.dart';
import '../../utils/CommonImageWidget.dart';
import '../controllers/UserControllers/GetMyOrderDetailController.dart';
import '../../models/MyOrdersModel.dart';
class Myorderdetailui extends StatefulWidget {
  Data? orderData;
  // int productid;
  Myorderdetailui({Key? key, required this.orderData}) : super(key: key);

  @override
  State<Myorderdetailui> createState() => _Myorderdetailui_screenState();
}

class _Myorderdetailui_screenState extends State<Myorderdetailui> {
  int selected_image = 0;
  Getmyorderdetailcontroller controller = Get.put(Getmyorderdetailcontroller());
  var addressData;
  int sizeindex = 0;
  String selectedValue = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      controller.get_orderdetail(widget.orderData!.id!.toInt());
      addressData=json.decode(widget.orderData?.address??"");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading:  Center(
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                    backgroundColor: themecolor.withOpacity(0.5),
                    radius: 16,
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: white,
                      size: 18,
                    ))),
          ),
          centerTitle: true,
          title: Text("Order Details",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: themecolor),),
        ),
          // bottomNavigationBar: Container(
          //   padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.5.h),
          //   height: 7.h, // Adjust height to fit both buttons
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           Get.to(Placeorderscreen());
          //         },
          //         child: Container(
          //           // margin: EdgeInsets.symmetric(horizontal: 15.w),
          //           alignment: Alignment.center,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8),
          //             color: themecolor,
          //           ),
          //           height: 6.h,
          //           width: double.infinity,
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               // Icon(Icons.share,color: white,size: 18,),
          //               // SizedBox(width: 1.w,),
          //               Text(
          //                 placeorder,
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                     fontSize: 15,
          //                     fontWeight: FontWeight.w600,
          //                     color: white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          body:
          controller.products.value!=null?
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  orderView(),
                  SizedBox(
                    height: 3.h,
                  ),
                  shipDetail(),

                  shippingDetail(),
                  SizedBox(
                    height: 3.h,
                  ),
                  addressView(),
                  SizedBox(
                    height: 3.h,
                  ),
                  totalAmount(),
                  SizedBox(
                    height: 2.h,
                  ),
                  // product_imageview(),
                  // product_content(),
                ],
              ),
            ),
          ):const Center(child: CircularProgressIndicator(),));
    });
  }
  Widget orderView(){
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 3.w),
      child: ListView.builder(physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.orderData!.products!.length,
          padding: EdgeInsets.zero,itemBuilder: (BuildContext context,int index){
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                elevation: 7,
                child: SizedBox(
                  height: 25.w,
                  width: 25.w,
                  child: CommonImageWidget(imageSourceType: ImageSourceType.cached_image,imageUrl: widget.orderData!.products!.elementAt(index).product!.productImage??"",fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.orderData?.products?.elementAt(index).product?.name??"",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(convertTimeDateFormat(widget.orderData?.createdAt??"00000-00-00"),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Text("$currency${widget.orderData?.products?.elementAt(index).product?.price??"0"} ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: themecolor),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      Text("x ${widget.orderData?.products?.elementAt(index).quantity??0}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),maxLines: 2,overflow: TextOverflow.ellipsis,),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  Widget shipDetail(){
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order id: ${widget.orderData?.id!.toInt()}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: blackcolor),),
            Text(widget.orderData?.status??"",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: themecolor),),
          ],
        ),
      ],
    ),);
  }
  Widget addressView(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Address",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: black)),
        SizedBox(
          height: 1.h,
        ),
        Text(
            '${addressData['house_number']??""}  ${addressData['street']??""}  ${addressData['city']??""}  ${addressData['state']??""}  ${addressData['pincode']??""}  ${addressData['landmark']??""}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.grey)),
      ],
    );
  }

  Widget product_content() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            productname_view(),
          ],
        ),
      ),
    );
  }

  Widget product_imageview() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            CarouselSlider.builder(
              itemCount: 1,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
                    height: 30.h,
                    // margin: EdgeInsets.only(left: 5, right: 5),
                    child: CommonImageWidget(
                      imageSourceType: ImageSourceType.network,
                      imageUrl: controller.products.value!.products![0].product!.productImage.toString(),
                      borderRadius: BorderRadius.circular(0),
                      fit: BoxFit.cover,
                    ),
                  ),
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged:
                    (int index, CarouselPageChangedReason changeReason) {
                  setState(() {
                    selected_image = index;
                  });
                },
                // autoPlay: true,
                aspectRatio: 1,
                enlargeCenterPage: false,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 3.w, right: 3.w, top: 4.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: CircleAvatar(
                              backgroundColor: themecolor.withOpacity(0.5),
                              radius: 16,
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: white,
                                size: 18,
                              ))),
                      // GestureDetector(
                      //     onTap: () {
                      //       if (controller.favouritestatus.value) {
                      //         controller.deletewishlist(
                      //             controller.products.value?.id?.toInt() ?? 0);
                      //       } else {
                      //         controller.addtowishlist(
                      //             controller.products.value?.id?.toInt() ?? 0);
                      //       }
                      //     },
                      //     child: controller.favouritestatus.value
                      //         ? Container(
                      //       margin: EdgeInsets.all(5),
                      //       height: 3.h,
                      //       alignment: Alignment.centerRight,
                      //       width: 20.w,
                      //       child: Icon(
                      //         Icons.favorite,
                      //         color: ordercncl_color,
                      //         size: 30,
                      //       ),
                      //     )
                      //         : Container(
                      //       margin: EdgeInsets.all(5),
                      //       height: 3.h,
                      //       alignment: Alignment.centerRight,
                      //       width: 20.w,
                      //       child: Icon(
                      //         Icons.favorite_border,
                      //         color: ordercncl_color,
                      //         size: 30,
                      //       ),
                      //     )),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }

  Widget productname_view() {
    return Container(
      margin: EdgeInsets.only(left: 3.w, right: 3.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.products.value?.products?[0].product?.name.toString() ?? "",
                style: Common_textstyles.producttitlestyle,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            controller.products.value?.products?[0].product?.description.toString() ?? "",
            style: Common_textstyles.productdescstyle,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       box_type,
          //       style: Common_textstyles.productoptionstyle,
          //     ),
          //     Container(
          //       height: 5.h,
          //       width: 45.w,
          //       child: DropdownButtonFormField2<String>(
          //         isExpanded: true,
          //         decoration: InputDecoration(
          //           filled: true,
          //           fillColor: Colors.transparent,
          //           contentPadding: const EdgeInsets.symmetric(vertical: 0),
          //           focusedBorder: OutlineInputBorder(
          //               borderRadius: BorderRadius.all(
          //                 Radius.circular(8.0),
          //               ),
          //               borderSide: BorderSide(color: bordercolorbordercolor)),
          //           border: OutlineInputBorder(
          //               borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //               borderSide: BorderSide(color: bordercolorbordercolor)),
          //           enabledBorder: OutlineInputBorder(
          //               borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //               borderSide: BorderSide(color: bordercolorbordercolor)),
          //           errorBorder: OutlineInputBorder(
          //               borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //               borderSide: BorderSide(color: bordercolorbordercolor)),
          //           // Add more decoration..
          //         ),
          //         hint: SizedBox(
          //           child: Text(
          //             select_box_type,
          //             style: TextStyle(fontSize: 14, color: hint_color),
          //             overflow: TextOverflow.ellipsis,
          //           ),
          //         ),
          //         items: controller.variants
          //             .map((String item) => DropdownMenuItem<String>(
          //           value: item,
          //           child: Text(
          //             item,
          //             style: const TextStyle(
          //               fontSize: 14,
          //             ),
          //           ),
          //         ))
          //             .toList(),
          //         validator: (value) {
          //           if (value == null) {
          //             return select_box_type;
          //           }
          //           return null;
          //         },
          //         onChanged: (newValue) {
          //           selectedValue = newValue!;
          //         },
          //         onSaved: (value) {
          //           selectedValue = value.toString();
          //         },
          //         buttonStyleData: const ButtonStyleData(
          //           padding: EdgeInsets.only(
          //             right: 8,
          //           ),
          //         ),
          //         iconStyleData: const IconStyleData(
          //           icon: Icon(
          //             Icons.arrow_drop_down,
          //             color: Colors.black45,
          //           ),
          //           iconSize: 24,
          //         ),
          //         dropdownStyleData: DropdownStyleData(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(8),
          //           ),
          //         ),
          //         menuItemStyleData: const MenuItemStyleData(
          //           padding: EdgeInsets.symmetric(horizontal: 16),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       packing_type,
          //       style: Common_textstyles.productoptionstyle,
          //     ),
          //     option_btn(
          //         controller.products.value?.products?[0].product?.packingType.toString() ?? "")
          //   ],
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Packing_Size,
                style: Common_textstyles.productoptionstyle,
              ),
              option_btn(
                  controller.products.value?.products?[0].product?.packingSize.toString() ?? "")
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: Common_textstyles.productoptionstyle,
              ),
        option_btn(
          controller.products.value != null && controller.products.value!.products![0].price != null
              ? "$currency ${controller.products.value?.products![0].price}"
              : "$currency 0.0",
        )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          // totalAmount()
        ],
      ),
    );
  }
  Widget shippingDetail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if(widget.orderData?.trackingId!=null)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 3.h,
            ),
            Text('Tracking Id: ${widget.orderData?.trackingId??"Coming Soon"}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: blackcolor),),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
        // if(widget.orderData?.company!=null)
          Text('Delivery Company: ${widget.orderData?.company??"Coming Soon"}',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: blackcolor),)
      ],
    );
  }

  Widget option_btn(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      // width: 15.w,
      height: 4.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: selectionborder)),
      child: Text(
        title,
        style: Common_textstyles.optionbtnstyle,
      ),
    );
  }

  Widget totalAmount() {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            total_amountstr,
            style: Common_textstyles.totalamountstyle,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                '$currency${widget.orderData?.orderTotal?.toInt()??0}',
                style: Common_textstyles.totalamountstyle,
              ),
            ],
          ),
        ],
      );
  }
}
