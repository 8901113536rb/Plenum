import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/Appcolors.dart';

class Commonappbarwidget extends StatelessWidget implements PreferredSizeWidget {
  final String? leftText;
  final bool showBackArrow;
  final String? rightText;
  final VoidCallback? onBackPressed;

  const Commonappbarwidget({
    this.leftText,
    this.showBackArrow = false,
    this.rightText,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Disable default back button
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showBackArrow)
                IconButton(
                  icon:  Icon(Icons.arrow_back,color: white,),
                  onPressed: onBackPressed ?? () => Navigator.pop(context),
                ),
              SizedBox(width: 2.w,),
              if (leftText != null)
              Text(
                leftText!,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          if (rightText != null)
            Text(
              rightText!,
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
      centerTitle: true,
      backgroundColor: themecolor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
