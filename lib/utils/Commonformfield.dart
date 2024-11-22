import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants/Appcolors.dart';

class Commonformfield extends StatelessWidget {
  final String hinttext;
  final String? title;
  final TextInputType? keyboardtype;
  final bool? readonly_status;
  final bool? obscuretxt;
  final String? Function(String?)? validator;
  final TextEditingController fieldcontroller;
  final Widget? prefix;
  final Widget? suffix; // Add suffix icon here
  final int? textlength; // Add suffix icon here

  Commonformfield({
    Key? key,
    required this.hinttext,
    required this.fieldcontroller,
    this.prefix,
    this.title,
    this.keyboardtype,
    this.validator,
    this.obscuretxt,
    this.readonly_status = false,
    this.suffix,
    this.textlength// Initialize suffix
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          SizedBox(
            height: 1.h,
          ),
          TextFormField(
            maxLength: textlength,
            obscureText:obscuretxt??false,
            readOnly: readonly_status ?? false,
            keyboardType: keyboardtype,
            validator: validator,
            cursorColor: themecolor,
            controller: fieldcontroller,
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: white,
              prefixIcon: prefix,
              suffixIcon: suffix, // Add suffixIcon to the InputDecoration
              contentPadding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width / 100) * 3,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
                borderSide: BorderSide(color: emailinputbordercolor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: emailinputbordercolor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: emailinputbordercolor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: emailinputbordercolor),
              ),
              disabledBorder: InputBorder.none,
              hintText: hinttext,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: emailhintcolor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
