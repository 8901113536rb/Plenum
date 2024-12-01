import 'package:flutter/material.dart';
import 'package:plenum/constants/Appcolors.dart';
import 'package:sizer/sizer.dart';

class NoDataFound extends StatelessWidget {
  final String message;
  final IconData icon;
  final double iconSize;
  final TextStyle? textStyle;

  const NoDataFound({
    Key? key,
    this.message = "No Data Found",
    this.icon = Icons.inbox,
    this.iconSize = 60.0,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color:black,
          ),
          SizedBox(height: 3.h),
          Text(
            message,
            style: textStyle ??
                TextStyle(
                  fontSize: 18,
                  color: black,
                  fontWeight: FontWeight.w600
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
