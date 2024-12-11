import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:plenum/views/UserSection/AboutUsUi.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/Networkconstants.dart';
import '../../constants/Textstyles.dart';
import '../../constants/appcolors.dart';
import '../../constants/stringconstants.dart';
import '../../controllers/UserControllers/DashboardController.dart';
import '../../utils/CommonAppBarWidget.dart';
import '../../utils/CommonImageWidget.dart';
import '../../utils/Commonwidgets.dart';
import '../../utils/CustomBottomRadius.dart';
import 'FavouriteProductsScreen.dart';
import 'FeaturedProductScreen.dart';
import 'MyOrdersScreen.dart';
import 'NewLaunchesScreen.dart';
import 'NotificationUi.dart';
import 'Placeorderscreen.dart';
import 'ProductsScreen.dart';
import 'UpcomingProductScreen.dart';
import 'VisualAid.dart';
import 'address/AddressListingScreen.dart';

class Dashboardui extends StatefulWidget {
  const Dashboardui({super.key});

  @override
  State<Dashboardui> createState() => _DashboarduiState();
}

class _DashboarduiState extends State<Dashboardui> {
  Dashboardcontroller controller = Get.put(Dashboardcontroller());
  List<String> titleText = [
    about_us,
    my_orders,
    products,
    new_launches,
    featured,
    upcoming,
    visual_ads,
    notifications,
    share_app,
  ];
  List<String> images = [
    "aboutus.svg",
    "orders.svg",
    "products.svg",
    "products.svg",
    "products.svg",
    "products.svg",
    "visualaids.svg",
    "messageicon.svg",
    "share.svg",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx((){
          return Scaffold(
            floatingActionButtonLocation: ExpandableFab.location,
            floatingActionButton: callButton(),
            body: Container(
              color: themecolor,
              child: Column(
                children: [
                  Expanded(
                    flex:  0,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appname,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: white),
                          ),
                          GestureDetector(
                            onTap: (){
                              Get.to(Placeorderscreen(),);
                            },
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child:Container(
                      decoration: const BoxDecoration(
                        color: Colors.white, // Background color for the rounded section
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          controller.bannerimages.isNotEmpty?
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.5.w),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CarouselSlider.builder(
                                  itemCount: controller.bannerimages.length,
                                  options: CarouselOptions(
                                    height: 18.h, // Adjusted height for carousel slider
                                    viewportFraction: 1.0,
                                    enableInfiniteScroll: true,
                                    autoPlay: false,
                                    autoPlayInterval: Duration(seconds: 3),
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        controller.selected_banner = index;
                                      });
                                    },
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int itemIndex, int pageViewIndex) =>
                                      Container(
                                          margin: const EdgeInsets.only(left: 5, right: 5),
                                          // decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(15),
                                          //     image: const DecorationImage(
                                          //         image: AssetImage(
                                          //           "assets/images/bannerdemo.png",
                                          //         ),
                                          //         fit: BoxFit.fill)
                                          child: CommonImageWidget(
                                            imageSourceType: ImageSourceType.cached_image,
                                            imageUrl: controller.bannerimages[itemIndex],
                                            borderRadius: BorderRadius.circular(15),
                                            fit: BoxFit.fill,
                                          )),
                                ),
                                Positioned(
                                  bottom: 0.5.h,
                                  child: DotsIndicator(
                                    dotsCount: controller.bannerimages.length,
                                    position: double.parse(controller.selected_banner.toString()),
                                    decorator: DotsDecorator(
                                      activeColor: themecolor,
                                      color: lightGreyColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ):
                          const Center(
                            child: Text(no_banner_found),
                          ),
                          Expanded(
                            child: featureList(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        })
    );
  }

  // Stack(
  // children: [
  // Container(
  // height: 14.h,
  // color: themecolor,
  // padding: EdgeInsets.only(left: 2.w, right: 4.w, top: 1.h),
  // child: Row(
  // mainAxisAlignment: MainAxisAlignment.start,
  // crossAxisAlignment: CrossAxisAlignment.center,
  // children: [
  // SizedBox(width: 2.w),
  // profile_picture(),
  // SizedBox(width: 3.w),
  // Column(
  // mainAxisAlignment: MainAxisAlignment.center,
  // crossAxisAlignment: CrossAxisAlignment.start,
  // children: [
  // Text(
  // "Rohit Bukkel",
  // style: TextStyle(
  // fontSize: 10.sp,
  // fontWeight: FontWeight.w600,
  // color: white),
  // ),
  // Text(
  // "rohit.23@gmail.com",
  // style: TextStyle(
  // fontSize: 10.sp,
  // color: white,
  // fontWeight: FontWeight.w500,
  // ),
  // ),
  // ],
  // ),
  // ],
  // ),
  // ),
  // Positioned(
  // top: 11.h, // Position the container below the top section
  // left: 0,
  // right: 0,
  // bottom: 0,
  // child: Container(
  // decoration: const BoxDecoration(
  // color: Colors.white, // Background color for the rounded section
  // borderRadius: BorderRadius.only(
  // topLeft: Radius.circular(30.0),
  // topRight: Radius.circular(30.0),
  // ),
  // ),
  // child: Column(
  // children: [
  // // CarouselSlider with fixed height
  // SizedBox(height: 2.h),
  // Container(
  // margin: EdgeInsets.symmetric(horizontal: 4.0.w),
  // child: Stack(
  // alignment: Alignment.bottomCenter,
  // children: [
  // CarouselSlider(
  // options: CarouselOptions(
  // height: 15.h, // Adjusted height for carousel slider
  // viewportFraction: 1.0,
  // enableInfiniteScroll: false,
  // autoPlay: false,
  // autoPlayInterval: Duration(seconds: 3),
  // onPageChanged: (index, reason) {
  // setState(() {
  // controller.currentIndex.value = index.toDouble();
  // });
  // },
  // ),
  // items: controller.imageList.map((imageUrl) {
  // return ClipRRect(
  // borderRadius: BorderRadius.circular(10.0),
  // child: Image.asset(
  // images_baseurl + imageUrl,
  // fit: BoxFit.cover,
  // width: double.infinity,
  // ),
  // );
  // }).toList(),
  // ),
  // Positioned(
  // bottom: 0.5.h,
  // child: DotsIndicator(
  // position: controller.currentIndex.value,
  // dotsCount: controller.imageList.length,
  // decorator: DotsDecorator(
  // activeColor: themecolor,
  // color: lightGreyColor,
  // ),
  // ),
  // ),
  // ],
  // ),
  // ),
  // Expanded(child: featureList(),)
  // ],
  // ),
  // ),
  // ),
  // ],
  // )
  Widget profile_picture() {
    return const CircleAvatar(
      radius: 20,
      backgroundImage:
          AssetImage("${images_baseurl}profilepic.png"), // Default avatar
    );
  }

  featureList() {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0,
        // childAspectRatio: 1.0,
      ),
      padding: EdgeInsets.only(left: 4.0.w, right: 4.w, top: 1.h, bottom: 1.h),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {
            if (index == 0) {
              Get.to(const Aboutusui());
            }
            else if (index == 1) {
              Get.to(const Myordersscreen());
            } else if (index == 2) {
              Get.to(const Productsscreen());
            } else if (index == 3) {
              Get.to(const Newlaunchesscreen());
            } else if (index == 4) {
              Get.to(const Featuredproductscreen());
            } else if (index == 5) {
              Get.to(const Upcomingproductscreen());
            }  else if (index == 6) {
              Get.to(const Visualaid());
            } else if (index == 7) {
              Get.to(const Notificationui());
            }else if (index == 8) {
              String sharelink="https://play.google.com/store/apps/details?id="+appPackageName;
              print("https://play.google.com/store/apps/details?id=$appPackageName");
              Share.share('Check out this amazing app!\n $sharelink',);
            }
            // Get.to();
          },
          child: Card(
              color: boxcolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: listDataView(titleText, index, images)),
        );
      },
    );
  }

  listDataView(List<String> name, int index, List<String> imagepath) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Stack(
            children: [
              Positioned(
                bottom: 2.h,
                left: 3.w,
                right: 3.w,
                child:
                    Text(name[index], style: Common_textstyles.optionbtnstyle),
              ),
              // Positioned(
              //   top: 3.h,
              //   left: 3.w,
              //   child: Text("1", style: Common_textstyles.optionbtnstyle),
              // ),
              Positioned(
                top: 1.5.h,
                right: 3.w,
                child: CircleAvatar(
                  radius: 4.w,
                  backgroundColor: white,
                  child: SvgPicture.asset(
                    images_baseurl + imagepath[index],
                    color: black,
                    fit: BoxFit.cover,
                    height: 2.1.h,
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget callButton() {
    return ExpandableFab(
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: Icon(
          Icons.menu,
          color: white,
        ),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: themecolor,
        backgroundColor: themecolor,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: DefaultFloatingActionButtonBuilder(
        child: Icon(
          Icons.menu,
          color: white,
        ),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: themecolor,
        backgroundColor: themecolor,
        shape: const CircleBorder(),
      ),
      key: controller.key,
      type: ExpandableFabType.up,
      childrenAnimation: ExpandableFabAnimation.none,
      distance: 8.h,
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.transparent.withOpacity(0.4),
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 25.w,
                height: 4.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: white,
                ),
                padding: EdgeInsets.only(top: 1.h),
                child: Text(call,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: black, fontWeight: FontWeight.w600))),
            SizedBox(width: 2.w),
            FloatingActionButton.small(
              foregroundColor: themecolor,
              backgroundColor: themecolor,
              heroTag: null,
              onPressed: () async {
                makeDirectCall(phoneNumber);
              },
              child: GestureDetector(
                onTap: (){
                  makeDirectCall(phoneNumber);
                },
                  child: Icon(Icons.phone, color: white)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 25.w,
                height: 4.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: white,
                ),
                padding: EdgeInsets.only(top: 1.h),
                child: Text(whatsapp,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: black, fontWeight: FontWeight.w600))),
            SizedBox(width: 2.w),
            FloatingActionButton.small(
              foregroundColor: themecolor,
              backgroundColor: themecolor,
              heroTag: null,
              onPressed: () {
                openWhatsApp(phoneNumber,"Hello, I would like to chat with you!");
              },
              child: GestureDetector(
                onTap: (){
                  openWhatsApp(phoneNumber,"Hello, I would like to chat with you!");
                },
                child: Icon(
                  Icons.chat_bubble,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
