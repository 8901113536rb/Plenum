import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import '../../constants/Appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/VisualAidController.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Commonwidgets.dart';
import '../../utils/NoDataFound.dart';
import 'Placeorderscreen.dart';
import 'VisualAidDetailUi.dart';

class Visualaid extends StatefulWidget {
  const Visualaid({super.key});

  @override
  State<Visualaid> createState() => _VisualaidState();
}

class _VisualaidState extends State<Visualaid> {
  final sample = List.generate(30, (i) => i);
  Visualaidcontroller controller = Get.put(Visualaidcontroller());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.searchcontroller.text=widget.searchdata!;
    Future.microtask(() {
      controller.products.clear();
      controller.get_VisualAid("", "", "");
      controller.fetchCategoriesData();
      scrollController?.addListener(() {
        if (scrollController!.position.pixels ==
                scrollController!.position.maxScrollExtent &&
            controller.hasMoreData.value) {
          controller.get_VisualAid(
              controller.selectedCategoryValue.value,
              controller.selectedSubCategoryValue.value,
              controller.searchcontroller.text,
              page: controller.currentPage.value);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          // appBar: appBar(),
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
                                visual_aid,
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
                                controller.currentPage.value = 1;
                                controller.products.clear();
                                controller.get_VisualAid(
                                  controller.selectedCategoryValue.value,
                                  controller.selectedSubCategoryValue.value,
                                  controller.searchcontroller.value.text,
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
                                    // style: const TextStyle(
                                    //   fontSize: 14,
                                    //   color: Colors.black,
                                    //   fontWeight: FontWeight.w500,
                                    //   overflow: TextOverflow.ellipsis,
                                    // ),
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
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
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
                                    items:
                                        controller.categories.map((category) {
                                      return DropdownMenuItem<String>(
                                        value: category['id'].toString(),
                                        child: Text(
                                          category['name'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      controller.selectedCategoryValue.value =
                                          newValue!;
                                      controller
                                              .selectedSubCategoryValue.value =
                                          ""; // Reset the subcategory value
                                      controller.subcategories.clear();
                                      controller.products.clear();
                                      controller.currentPage.value =
                                          1; // Clear the subcategories list
                                      controller
                                          .get_VisualAid(
                                              controller
                                                  .selectedCategoryValue.value,
                                              controller
                                                  .selectedSubCategoryValue
                                                  .value,
                                              controller.searchcontroller.text,
                                              page:
                                                  controller.currentPage.value)
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
                                        : controller
                                            .selectedSubCategoryValue.value,
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
                                    onChanged: (newValue) {
                                      controller.selectedSubCategoryValue
                                          .value = newValue!;
                                      controller.currentPage.value = 1;
                                      controller.products.clear();
                                      controller. get_VisualAid(
                                          controller
                                              .selectedCategoryValue.value,
                                          controller
                                              .selectedSubCategoryValue.value,
                                          controller.searchcontroller.text,
                                          page: controller.currentPage.value);
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
                                    controller.selectedSubCategoryValue.value = "";
                                    controller.searchcontroller.clear();
                                    controller.subcategories.clear();
                                    controller.products.clear();
                                    controller.currentPage.value = 1;
                                    controller.get_VisualAid(
                                        controller.selectedCategoryValue.value,
                                        controller
                                            .selectedSubCategoryValue.value,
                                        "",
                                        page: controller.currentPage.value);
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
                                ? productView()
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

  productView() {
    return GridView.builder(
      shrinkWrap: true,
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 3, crossAxisSpacing: 1),
      padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
      itemCount: controller.products.length, // <-- required
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Get.to(Visualaiddetailui(
            productsimage: controller.products,
            initialPage: index,
          ));
        },
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Card(
              // color: themecolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(8.0), // Optional: rounded corners
                child: CommonImageWidget(
                  imageSourceType: ImageSourceType.cached_image,
                  imageUrl: controller.products[index],
                  fit: BoxFit.fill,
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  String visualaddLink = controller.products.elementAt(index);
                  Share.share(visualaddLink);
                },
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: white,
                      child: Icon(Icons.share_outlined, color: black),
                    )))
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.searchcontroller.clear();
  }
}
