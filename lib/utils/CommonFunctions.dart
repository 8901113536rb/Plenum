import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

String convertTimeDateFormat(String inputDate){

  DateTime parsedDate = DateTime.parse(inputDate);

  // Format the date to the desired format
  String formattedDate = DateFormat("dd MMM, yyyy HH:mm:ss").format(parsedDate);
  return formattedDate;
}
String orderDateFormat(String inputDate){

  DateTime parsedDate = DateTime.parse(inputDate);

  // Format the date to the desired format
  String formattedDate = DateFormat("dd MMM, yyyy").format(parsedDate);
  return formattedDate;
}