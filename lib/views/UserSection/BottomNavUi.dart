import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../constants/Stringconstants.dart';
import '../../constants/appcolors.dart';
import 'DashboardUi.dart';
import 'FavouriteProductsScreen.dart';
import 'MyProfileScreen.dart';
import 'NotificationUi.dart';
import 'Placeorderscreen.dart';
import 'ProductsScreen.dart';
import 'ProfileUi.dart';
import 'VisualAid.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;
  final pages = [
    Dashboardui(),
    Productsscreen(),
    Visualaid(),
    Favouriteproductsscreen(),
    Myprofilescreen()
    // Placeorderscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Card(
        color: themecolor,
        margin: EdgeInsets.zero,
        child: Container(
          color: themecolor,
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          // height: 10.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomnav_item("home.svg", home, 0),
              bottomnav_item("products.svg", products, 1),
              bottomnav_item("visualaids.svg", visual_ads, 2),
              bottomnav_item("favourites.svg", favourite, 3),
              bottomnav_item("profile.svg", profile, 4),
            ],
          ),
        ),
      ),
      body: pages[_currentIndex],
    );
  }

  Widget bottomnav_item(String icon, String title, int position) {
    return InkWell(
      highlightColor: themecolor,
      splashColor: themecolor,
      onTap: () {
        setState(() {
          _currentIndex = position;
        });
      },
      child: SizedBox(
        height: 9.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.5.h,
            ),
            SvgPicture.asset(
              images_baseurl + icon,
              color: _currentIndex == position ? white : lightGreyColor,
              height: 18,
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Text(
              title,
              style: TextStyle(
                  color: _currentIndex == position ? white : lightGreyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
