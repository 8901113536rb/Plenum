import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';


class Dashboardcontroller extends GetxController{
  final key = GlobalKey<ExpandableFabState>();
  RxDouble currentIndex=0.0.obs;
  final List<String> imageList = [
    "dummy_image.png",
    "dummy_image.png",
    "dummy_image.png",
  ].obs;
}