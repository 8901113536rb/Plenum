import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/Appcolors.dart';

class CommonbtnWidget extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;

  CommonbtnWidget({Key? key, required this.title, this.onTap}) : super(key: key);

  @override
  State<CommonbtnWidget> createState() => _CommonbtnWidgetState();
}

class _CommonbtnWidgetState extends State<CommonbtnWidget> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        widget.onTap!();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themecolor,
        ),
        height: 6.h,
        width: double.infinity,
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: white),
        ),
      ),
    );
  }
}
