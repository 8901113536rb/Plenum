import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../utils/Sharedutils.dart';

class Myprofilecontroller extends GetxController{
  RxString first_name="".obs;
  RxString last_name="".obs;
  RxString profile_image="".obs;

  getuserdetails() async {
    first_name.value=await SharedUtils().get_userfirstname()??"";
    last_name.value=await SharedUtils().get_userlastname()??"";
    profile_image.value=await SharedUtils().get_userimage()??"";
  }
}