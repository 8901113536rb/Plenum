
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../models/GetAboutUs.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';

class Aboutuscontroller extends GetxController{

  Rx<GetAboutUs?> products = Rx<GetAboutUs?>(null);

  @override
  void onInit() {
    super.onInit();
  }

}