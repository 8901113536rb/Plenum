import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import '../../constants/appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/NewlaunchesController.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Commonwidgets.dart';
import '../../utils/NoDataFound.dart';
import 'Placeorderscreen.dart';
import 'ProductDetailScreen.dart';

class Newlaunchesscreen extends StatefulWidget {
  const Newlaunchesscreen({super.key});

  @override
  State<Newlaunchesscreen> createState() => _NewlaunchesscreenState();
}

class _NewlaunchesscreenState extends State<Newlaunchesscreen> {
  Newlaunchescontroller controller = Get.put(Newlaunchescontroller());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      controller.products.clear();
      controller.get_product(
        "",
        "",
        "",
      );
      controller.fetchCategoriesData();
      scrollController?.addListener(() {
        if (scrollController!.position.pixels ==
            scrollController!.position.maxScrollExtent && controller.hasMoreData.value) {
          controller.get_product(controller.selectedCategoryValue.value, controller.selectedSubCategoryValue.value, controller.searchcontroller.text, page: controller.currentPage.value);
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                new_launches,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.toggleSearch();
                                    },
                                    child: Icon(Icons.search, color: white),
                                  ),
                                  SizedBox(width: 2.w),
                                  GestureDetector(
                                      onTap: () {
                                        Get.to(const Placeorderscreen());
                                      },
                                      child: Icon(Icons.shopping_bag_outlined,
                                          color: white)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                              controller.isSearchVisible.value ? 1.h : 0),
                          if (controller.isSearchVisible.value)
                            searchbar(controller.searchcontroller, context, () {
                              print("on tap search....");
                              if (controller.searchcontroller.text == "") {
                                failed_toast(please_enter_text);
                              } else {
                                controller.currentPage.value=1;
                                controller.products.clear();
                                controller.get_product(
                                    controller.selectedCategoryValue.value,
                                    controller.selectedSubCategoryValue.value,
                                    controller.searchcontroller.value.text,
                                    page: controller.currentPage.value
                                );
                              }
                            }),
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
                      child: Column(
                        children: [
                          // Dropdown and Clear Button Row
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 4.5.w, vertical: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Dropdown for Division
                                SizedBox(
                                  height: 5.h,
                                  width: 32.w,
                                  child: DropdownButtonFormField2<String>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          vertical: 0),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0)),
                                        borderSide:
                                        BorderSide(color: dropdownborder),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0)),
                                        borderSide:
                                        BorderSide(color: dropdownborder),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0)),
                                        borderSide:
                                        BorderSide(color: dropdownborder),
                                      ),
                                    ),
                                    hint: const Text(
                                      category,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    items:
                                    controller.categories.map((category) {
                                      return DropdownMenuItem<String>(
                                        value: category['id'].toString(),
                                        child: Text(category['name'],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      );
                                    }).toList(),
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return controller.categories.map((item) {
                                        return Text(
                                          item['name'].toString(),
                                          overflow: TextOverflow
                                              .ellipsis, // Truncate the selected text
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    onChanged: (newValue) {
                                      controller.selectedCategoryValue.value =
                                      newValue!;
                                      controller
                                          .selectedSubCategoryValue.value =
                                      ""; // Reset the subcategory value
                                      controller.subcategories
                                          .clear(); // Clear the subcategories list
                                      controller.products.clear();
                                      controller.currentPage.value=1;
                                      controller
                                          .get_product(
                                          controller
                                              .selectedCategoryValue.value,
                                          controller
                                              .selectedSubCategoryValue
                                              .value,
                                          controller.searchcontroller.text,page: controller.currentPage.value)
                                          .then((success) {
                                        controller.get_subcategory(controller
                                            .selectedCategoryValue.value);
                                      });
                                    },
                                    onSaved: (value) {
                                      controller.selectedCategoryValue.value =
                                          value.toString();
                                    },
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
                                    menuItemStyleData: MenuItemStyleData(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        height: 9.h),
                                  ),
                                ),
                                // Dropdown for Category
                                SizedBox(
                                  height: 5.h,
                                  width: 32.w,
                                  child: DropdownButtonFormField2<String>(
                                    isExpanded: true,
                                    value: controller.selectedSubCategoryValue
                                        .value.isEmpty
                                        ? null
                                        : controller.selectedSubCategoryValue
                                        .value, // Ensure the value is null if not set
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          vertical: 0),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0)),
                                        borderSide:
                                        BorderSide(color: dropdownborder),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0)),
                                        borderSide:
                                        BorderSide(color: dropdownborder),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0)),
                                        borderSide:
                                        BorderSide(color: dropdownborder),
                                      ),
                                    ),
                                    hint: const Text(
                                      subcategory,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    items: controller.subcategories
                                        .map((category) {
                                      return DropdownMenuItem<String>(
                                        value: category['id'].toString(),
                                        child: Text(category['name'],
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      );
                                    }).toList(),
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return controller.subcategories
                                          .map((item) {
                                        return Text(
                                          item['name'].toString(),
                                          overflow: TextOverflow
                                              .ellipsis, // Truncate the selected text
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    onChanged: (newValue) {
                                      controller.selectedSubCategoryValue
                                          .value = newValue!;
                                      controller.currentPage.value=1;
                                      controller.products.clear();
                                      controller.get_product(
                                          controller
                                              .selectedCategoryValue.value,
                                          controller
                                              .selectedSubCategoryValue.value,
                                          controller.searchcontroller.text,page: controller.currentPage.value);
                                      controller.products.clear();
                                      controller.hasMoreData.value=true;
                                    },
                                    onSaved: (value) {
                                      controller.selectedSubCategoryValue
                                          .value = value.toString();
                                    },
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
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                ),
                                // Clear Button
                                GestureDetector(
                                  onTap: () {
                                    controller.selectedCategoryValue.value = "";
                                    controller.selectedSubCategoryValue.value =
                                    "";
                                    controller.searchcontroller.clear();
                                    controller.subcategories.clear();
                                    controller.products.clear();
                                    controller.hasMoreData.value=true;
                                    controller.currentPage.value=1;
                                    controller.get_product(
                                        "",
                                        "",
                                        "",page: controller.currentPage.value
                                    );
                                  },
                                  child: Container(
                                    height: 5.h,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0)),
                                      border: Border.all(color: dropdownborder),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.refresh,
                                            color: Colors.black, size: 20),
                                        SizedBox(width: 2.w),
                                        const Text(
                                          clear,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Expanded Product List
                          Expanded(
                            child: controller.products.isNotEmpty
                                ? productlistview()
                                : const NoDataFound(
                              message: no_data_found,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      );
    });
  }

  Widget productlistview() {
    return ListView.builder(
        controller: scrollController,
        // padding: EdgeInsets.only(bottom: 2.h),
        itemCount: controller.products.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Main Container
                  Positioned(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(Productdetailscreen(
                            productid: controller.products
                                .elementAt(index)
                                .id
                                ?.toInt() ??
                                0));
                      },
                      child: Container(
                        width: double.infinity,
                        // height: 15.5.h,
                        margin: EdgeInsets.only(left: 4.w, right: 4.w),
                        decoration: BoxDecoration(
                          color: boxcolor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.2),
                              blurRadius: 20.0, // Soften the shadow
                              spreadRadius: 0.0, // Extend the shadow
                              offset: const Offset(
                                5.0, // Move right 5 horizontally
                                5.0, // Move down 5 vertically
                              ),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.5.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 30.w,
                                height: 14.h,
                                child: CommonImageWidget(
                                  imageSourceType: ImageSourceType.cached_image,
                                  imageUrl: controller.products
                                      .elementAt(index)
                                      .productImage
                                      .toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              //SizedBox(width: 1.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                    child: Text(
                                      controller.products
                                          .elementAt(index)
                                          .name
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 1.h),
                                  SizedBox(
                                    width: 40.w,
                                    child: Text(
                                      controller.products
                                          .elementAt(index)
                                          .description
                                          .toString(),
                                      maxLines: 4,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: black,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //       padding: const EdgeInsets.all(3),
                                  //       decoration: BoxDecoration(
                                  //           color: themecolor,
                                  //           borderRadius: BorderRadius.circular(5)),
                                  //       child: Icon(
                                  //         Icons.add,
                                  //         color: white,
                                  //         size: 20,
                                  //       ),
                                  //     ),
                                  //     SizedBox(width: 1.w,),
                                  //     // Container(
                                  //     //   padding:  EdgeInsets.all(3),
                                  //     //   child: Text("0",style: TextStyle(color: black,fontSize: 15),),
                                  //     // ),
                                  //     SizedBox(width: 1.w,),
                                  //     Container(
                                  //       padding: const EdgeInsets.all(3),
                                  //       decoration: BoxDecoration(
                                  //           color: themecolor,
                                  //           borderRadius: BorderRadius.circular(5)),
                                  //       child: Icon(
                                  //         Icons.remove,
                                  //         color: white,
                                  //         size: 20,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                ],
                              ),
                              FavoriteButton(
                                isFavorite: controller.products
                                    .elementAt(index)
                                    .inWishlist ??
                                    false,
                                iconSize: 40,
                                valueChanged: (status) {
                                  if (!status) {
                                    controller.deletewishlist(controller
                                        .products
                                        .elementAt(index)
                                        .id
                                        ?.toInt() ??
                                        0);
                                  } else {
                                    controller.addtowishlist(controller.products
                                        .elementAt(index)
                                        .id
                                        ?.toInt() ??
                                        0);
                                  }
                                },
                              ),
                              // GestureDetector(
                              //     onTap: () {
                              //       if (controller.favouritestatus.value) {
                              //         controller
                              //             .deletewishlist(controller.products.elementAt(index).id?.toInt()??0);
                              //       } else {
                              //         controller.addtowishlist(controller.products.elementAt(index).id?.toInt()??0);
                              //       }
                              //     },
                              //     child:  controller.favouritestatus.value
                              //         ? Icon(
                              //       Icons.favorite,
                              //       color: ordercncl_color,
                              //     )
                              //         : Icon(
                              //       Icons.favorite_border,
                              //       color: ordercncl_color,
                              //     )
                              // ),
                              GestureDetector(
                                  onTap: () {
                                    String message =
                                        "${controller.products.elementAt(index).name ?? ""}\n${controller.products.elementAt(index).description ?? ""}\nMRP Rs.${controller.products.elementAt(index).price ?? ""}\n${controller.products.elementAt(index).productImage ?? ""}";
                                    Share.share(message);
                                  },
                                  child:
                                  Icon(Icons.share_outlined, color: black)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // MRP Box
                  Positioned(
                    bottom: -2.h, // Move half of the box outside
                    right: 8.w,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 42.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                          gradient: LinearGradient(
                            colors: [
                              gradientcolor1, // Start color
                              gradientcolor2, // End color
                            ],
                            begin: Alignment.topLeft, // Gradient start point
                            end: Alignment.bottomRight, // Gradient end point
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "MRP Rs.  ${controller.products.elementAt(index).price}",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              )
            ],
          );
        });
  }
}
