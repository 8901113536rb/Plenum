import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/Appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/VisualAidController.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/Commonwidgets.dart';
import 'VisualAidDetailUi.dart';

class Visualaid extends StatefulWidget {
  const Visualaid({super.key});

  @override
  State<Visualaid> createState() => _VisualaidState();
}

class _VisualaidState extends State<Visualaid> {
  final sample = List.generate(30, (i) => i);
  Visualaidcontroller controller = Get.put(Visualaidcontroller());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.searchcontroller.text=widget.searchdata!;
    Future.microtask(() {
      controller.get_VisualAid();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        appBar: appBar(),
        body: productView(),
      );
    });
  }
  appBar(){
    return AppBar(
      toolbarHeight: controller.isSearchVisible.value?20.h:15.h,
      automaticallyImplyLeading: false, // Disable default back button
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                visual_aid,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                  onTap: (){
                    controller.toggleSearch();
                  },
                  child: Icon(Icons.search))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 2.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 5.h,
                      width: 32.w,
                      child: DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 0),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide(color: white)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          // Add more decoration..
                        ),
                        hint: SizedBox(
                          child: Text(
                            divisions,
                            style: TextStyle(fontSize: 14, color: black,fontWeight: FontWeight.w500),
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
                                fontWeight: FontWeight.w500
                            ),
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
                          controller.selectedDivisionValue.value = value.toString();
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
                      width: 32.w,
                      child: DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 0),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              borderSide: BorderSide(color: white)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: white)),
                          // Add more decoration..
                        ),
                        hint: SizedBox(
                          child: Text(
                            category,
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: black),
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
                                fontWeight: FontWeight.w500
                            ),
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
                          controller.selectedCategoryValue.value = value.toString();
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
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        // borderSide: BorderSide(color: white)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.refresh,color: black,size: 20,),
                          SizedBox(width: 2.w,),
                          Text(clear, style: TextStyle(fontSize: 14, color: black),)
                        ],
                      ),
                    )
                  ],
                ),
                controller.isSearchVisible.value?
                SizedBox(height: 1.h,):const SizedBox(),
                controller.isSearchVisible.value?
                searchbar(controller.searchcontroller,context,(){}):const SizedBox()
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
  productView(){
    return  GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 3,
        crossAxisSpacing: 1
      ),
      padding: EdgeInsets.only(left:2.w,right: 2.w,top: 2.h),
      itemCount: controller.products.length, // <-- required
      itemBuilder: (context, index) => GestureDetector(
        onTap: (){
          Get.to(Visualaiddetailui(productsimage: controller.products));
        },
        child: Card(
          // color: themecolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child:ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
            child: CommonImageWidget(
              imageSourceType: ImageSourceType.cached_image,
              imageUrl: controller.products[index],
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
