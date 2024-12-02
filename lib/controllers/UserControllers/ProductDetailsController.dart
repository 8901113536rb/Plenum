import 'package:get/get.dart';
import 'package:plenum/views/UserSection/Placeorderscreen.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../models/GetProductDetailModel.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';

class ProductDetailController extends GetxController{
  final List<String> variants = [
    'Small',
    'Medium',
    'Large',
  ].obs;
  Rx<Data?> products = Rx<Data?>(null);
  RxBool favouritestatus=false.obs;
  RxInt quantity =1.obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

  }
  addtocart(String productid) async {
    Map<String,dynamic>param={
      "product_id": productid.toString(),
      "quantity": quantity.value,
    };
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitPost(url: addtocart_endpoint,param);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.statusCode.toString()==success_statuscode){
          success_toast("Product added to cart successfully!");
          Get.to(Placeorderscreen());
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }

  get_productdetail(int productid) async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitget2(url: getProductDetails+productid.toString());
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.statusCode.toString()==success_statuscode){
          GetProductDetailModel productdata=GetProductDetailModel.fromJson(response.body);
          products.value=productdata.data;
          favouritestatus.value=products.value?.inWishlist??false;
          print("favourite status:---"+favouritestatus.value.toString());
          favouritestatus.refresh();
          products.refresh();
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
  addtowishlist(int productid) async {
    Map<String,dynamic>param={"product_id":productid};
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitPost(url: addToFavourite,param);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.body["status"]==true){
          success_toast(response.body["message"].toString());
          favouritestatus.value=true;
          favouritestatus.refresh();
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
  deletewishlist(int productid) async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitdelete(url: removewishlist+productid.toString(),);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.body["status"]==true){
          success_toast(response.body["message"].toString());
          favouritestatus.value=false;
          favouritestatus.refresh();
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
}