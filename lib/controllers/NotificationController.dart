import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../api/BaseProvider.dart';
import '../constants/Networkconstants.dart';
import '../models/GetNotificationModel.dart';
import '../utils/CommonToast.dart';
import '../utils/Progressdialog.dart';

class Notificationcontroller extends GetxController{
  var notificationdata=<Data>[].obs;

  get_notification() async {
    showProgressDialog(Get.context!);
    try{
      Response response=await Baseprovider().hitget2(url: getNotifications);
      hideprogressDialog(Get.context!);
      print('Response: ${response.body}');
      if (response.status.hasError) {
        print('Error: ${response.statusText}');
        failed_toast(response.body["message"].toString());
      } else {
        if(response.statusCode.toString()==success_statuscode){
          GetNotificationModel productdata=GetNotificationModel.fromJson(response.body);
          notificationdata.value=productdata.data!;
        }
      }
    }catch(e){
      print('Error: ${e.toString()}');
    }

  }
  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    // Convert to local time if needed
    DateTime localDateTime = dateTime.toLocal();
    // Format the date
    String formattedDate = DateFormat('dd MMM yyyy hh:mm a').format(localDateTime);
    return formattedDate;
  }
}