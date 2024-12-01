import 'package:get/get.dart';

import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../models/GetCartModel.dart' as cartdata;
import '../../models/GetaddressModel.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';


class Placeordercontroller extends GetxController{
  Rx<Data?> addressdata = Rx<Data?>(null);

  var products=<cartdata.Data>[].obs;

  get_orders() async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitget2(url: getCartProducts);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.statusCode.toString()==success_statuscode){
          cartdata.GetCartModel productdata=cartdata.GetCartModel.fromJson(response.body);
          products.value=productdata.data!;
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }
  }
}