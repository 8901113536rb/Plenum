import 'package:get/get.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../models/GetMyOrderDetailModel.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';

class Getmyorderdetailcontroller extends GetxController{
  final List<String> variants = [
    'Small',
    'Medium',
    'Large',
  ].obs;
  Rx<Data?> products = Rx<Data?>(null);
  RxBool favouritestatus=false.obs;
  var addressData="".obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();

  }
  get_orderdetail(int productid) async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitget2(url: getuser_orders_endpoint+productid.toString());
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.statusCode.toString()==success_statuscode){
          GetMyOrderDetailModel productdata=GetMyOrderDetailModel.fromJson(response.body);
          products.value=productdata.data;
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
  addtowishlist(int productid) async {
    Map<String,dynamic>param={"product_id":productid.toString()};
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
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
}