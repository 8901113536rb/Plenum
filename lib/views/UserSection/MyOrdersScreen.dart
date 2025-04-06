import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plenum/models/MyOrdersModel.dart';
import 'package:plenum/utils/CommonFunctions.dart';
import 'package:plenum/views/MyOrderDetailUi.dart';
import 'package:sizer/sizer.dart';
import '../../constants/appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/MyOrdersController.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/Commonwidgets.dart';
import '../../utils/NoDataFound.dart';

class Myordersscreen extends StatefulWidget {
  const Myordersscreen({super.key});

  @override
  State<Myordersscreen> createState() => _MyordersscreenState();
}

class _MyordersscreenState extends State<Myordersscreen> {
  Myorderscontroller controller = Get.put(Myorderscontroller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.searchcontroller.text=widget.searchdata!;
    Future.microtask(() {
      controller.orders.clear();
      controller.get_orders();
      controller.scrollController?.addListener(() {
        if (controller.scrollController!.position.pixels ==
                controller.scrollController!.position.maxScrollExtent &&
            controller.hasMoreData.value) {
          controller.get_orders(page: controller.currentPage.value);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          //appBar: appBar(),
          body: Container(
              color: themecolor,
              child: Column(
                children: [
                  // Top Section with Title and Search Bar
                  Expanded(
                    flex: 0,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: white,
                                  )),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                my_orders,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  controller.isSearchVisible.value ? 1.h : 0),
                          if (controller.isSearchVisible.value)
                            searchbar(
                                controller.searchcontroller, context, () {}),
                        ],
                      ),
                    ),
                  ),
                  // Bottom Section with Dropdowns and Product List
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: controller.orders.isNotEmpty
                          ? productListView()
                          : const NoDataFound(
                              message: no_data_found,
                            ),
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }

  appBar() {
    return AppBar(
      toolbarHeight: controller.isSearchVisible.value ? 20.h : 15.h,
      automaticallyImplyLeading: false, // Disable default back button
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                products,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                  onTap: () {
                    controller.toggleSearch();
                  },
                  child: const Icon(Icons.search))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 2.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 5.h,
                      width: 32.w,
                      child: DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide(color: white)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          // Add more decoration..
                        ),
                        hint: SizedBox(
                          child: Text(
                            divisions,
                            style: TextStyle(
                                fontSize: 14,
                                color: black,
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        items: controller.divisionItems
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ))
                            .toList(),
                        // validator: (value) {
                        //   if (value == null) {
                        //     return select_box_type;
                        //   }
                        //   return null;
                        // },
                        onChanged: (newValue) {
                          controller.selectedDivisionValue.value = newValue!;
                        },
                        onSaved: (value) {
                          controller.selectedDivisionValue.value =
                              value.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(
                            right: 8,
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                      width: 32.w,
                      child: DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide(color: white)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          // Add more decoration..
                        ),
                        hint: SizedBox(
                          child: Text(
                            category,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: black),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        items: controller.categoryItems
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ))
                            .toList(),
                        // validator: (value) {
                        //   if (value == null) {
                        //     return select_box_type;
                        //   }
                        //   return null;
                        // },
                        onChanged: (newValue) {
                          controller.selectedCategoryValue.value = newValue!;
                        },
                        onSaved: (value) {
                          controller.selectedCategoryValue.value =
                              value.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(
                            right: 8,
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 5.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        // borderSide: BorderSide(color: white)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.refresh,
                            color: black,
                            size: 20,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            clear,
                            style: TextStyle(fontSize: 14, color: black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                controller.isSearchVisible.value
                    ? SizedBox(
                        height: 1.h,
                      )
                    : const SizedBox(),
                controller.isSearchVisible.value
                    ? searchbar(controller.searchcontroller, context, () {})
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: themecolor,
      elevation: 0,
    );
  }

  Widget productListView() {
    return ListView.builder(
        controller: controller.scrollController,
        padding: EdgeInsets.only(top: 2.h),
        itemCount: controller.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Get.to(Myorderdetailui(orderData:
                      controller.orders.elementAt(index),
                ));
              },
              child: orderView(controller.orders.elementAt(index)));
          //   Column(
          //   children: [
          //     Stack(
          //       clipBehavior: Clip.none,
          //       children: [
          //         // Main Container
          //         Positioned(
          //           child: GestureDetector(
          //             onTap: (){
          //               Get.to(Myorderdetailui(productid:   controller.orders.elementAt(index).id!.toInt()??0,));
          //             },
          //             child: Container(
          //               width: double.infinity,
          //               // height: 15.5.h,
          //               margin: EdgeInsets.only(left: 4.w, right: 4.w),
          //               decoration: BoxDecoration(
          //                 color: boxcolor,
          //                 borderRadius: BorderRadius.circular(20),
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Colors.grey.withOpacity(.2),
          //                     blurRadius: 20.0, // Soften the shadow
          //                     spreadRadius: 0.0, // Extend the shadow
          //                     offset: const Offset(
          //                       5.0, // Move right 5 horizontally
          //                       5.0, // Move down 5 vertically
          //                     ),
          //                   )
          //                 ],
          //               ),
          //               child: Padding(
          //                 padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
          //                 child: Row(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     SizedBox(
          //                       width: 30.w,
          //                       height: 14.h,
          //                       child: CommonImageWidget(
          //                         imageSourceType: ImageSourceType.cached_image,
          //                         imageUrl: controller.orders.elementAt(index).products?[0].product?.productImage.toString()??"",
          //                         fit: BoxFit.fill,
          //                       ),
          //                     ),
          //                     SizedBox(width: 3.5.w),
          //                     Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         SizedBox(
          //                           width: 50.w,
          //                           child: Row(
          //                             children: [
          //                               Text('Order Id: ',
          //                                 overflow: TextOverflow.ellipsis,
          //                                 style: TextStyle(
          //                                   fontSize: 15,
          //                                   fontWeight: FontWeight.w500,
          //                                   color: themecolor,
          //                                 ),
          //                               ),
          //                               Text(controller.orders
          //                                               .elementAt(index)
          //                                               .products?[0]
          //                                               .id.toString() ??
          //                                           "",
          //                                 overflow: TextOverflow.ellipsis,
          //                                 style: TextStyle(
          //                                   fontSize: 15,
          //                                   fontWeight: FontWeight.w500,
          //                                   color: themecolor,
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           height: 5,
          //                         ),
          //                         SizedBox(
          //                           width: 40.w,
          //                           child: Text(
          //                             controller.orders.elementAt(index).products?[0].product?.name.toString()??"",
          //                             overflow: TextOverflow.ellipsis,
          //                             style: TextStyle(
          //                               fontSize: 17,
          //                               fontWeight: FontWeight.w600,
          //                               color: black,
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(height: 1.h),
          //                         SizedBox(
          //                           width: 40.w,
          //                           child: Text(
          //                             controller.orders.elementAt(index).products?[0].product?.description.toString()??"",
          //                             maxLines: 4,
          //                             style: TextStyle(
          //                               fontSize: 12,
          //                               fontWeight: FontWeight.w500,
          //                               color: black,
          //                               overflow: TextOverflow.ellipsis,
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(width:2.w,),
          //                       ],
          //                     ),
          //                     // Icon(Icons.favorite, color: ordercncl_color),
          //                     // Icon(Icons.share_outlined, color: black),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         // MRP Box
          //         Positioned(
          //           bottom: -2.h, // Move half of the box outside
          //           right: 8.w,
          //           child: Align(
          //             alignment: Alignment.bottomCenter,
          //             child: Container(
          //               width: 42.w,
          //               height: 4.h,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(12), // Rounded corners
          //                 gradient: LinearGradient(
          //                   colors: [
          //                     gradientcolor1, // Start color
          //                     gradientcolor2, // End color
          //                   ],
          //                   begin: Alignment.topLeft, // Gradient start point
          //                   end: Alignment.bottomRight, // Gradient end point
          //                 ),
          //               ),
          //               child: Center(
          //                 child: Text(
          //                   "MRP Rs.  ${  controller.orders.elementAt(index).products?[0].product?.price}",
          //                   style: TextStyle(
          //                     fontSize: 12,
          //                     fontWeight: FontWeight.w600,
          //                     color: white,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     SizedBox(height: 3.h,)
          //   ],
          // );
        });
  }

  Widget orderView(var data) {
    Data orderData = data;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
      // height: 12.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade200, width: 0.8)),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Ensures the row fills the height
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(3.h),
          //     border: Border.all(color: Colors.grey.shade200, width: 0.8),
          //     color: themecolor,
          //   ),
          //   width: 7,
          // ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 2.h),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: 5.h,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "#Order id:${orderData.id}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: themecolor),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: themecolor)),
                        child: Text(
                          orderData.status ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: themecolor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            orderDateFormat(orderData.createdAt??"00000-00-00"),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: black),
                      )),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Quantity: ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              orderData.products?.length.toString() ?? "0",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: themecolor),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "${currency}${orderData.orderTotal ?? "0"}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: themecolor),
                        textAlign: TextAlign.right,
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
