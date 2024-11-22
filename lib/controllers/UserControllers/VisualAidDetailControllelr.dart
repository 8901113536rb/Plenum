
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class Visualaiddetailcontrollelr extends GetxController{
  RxInt currentIndex=0.obs;
  final List<String> imageUrls = [
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
    'dummy_image.png',
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

}