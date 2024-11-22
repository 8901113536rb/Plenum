import 'package:get/get.dart';

class ProductDetailController extends GetxController{
  final List<String> variants = [
    'Small',
    'Medium',
    'Large',
  ].obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

  }

}