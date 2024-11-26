import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedUtils {
  var userdetail="Userdetails";
  var token="token";
  var address="address";
  var userfirstname="first_name";
  var userlastname="last_name";
  var useremail="email";
  var userphone="phone";
  var userimage="image";

  save_user_data(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userdetail, data);
  }

  save_address_data(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(address, data);
  }

  save_token(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(token, data);
  }

  save_userfirstname(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userfirstname, data);
  }
  save_userlastname(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userlastname, data);
  }
  save_useremail(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(useremail, data);
  }
  save_userphone(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userphone, data);
  }
  save_userimage(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userimage, data);
  }
  // save_logintype(String data) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(login_type, data);
  // }
  //
  // Future<String?> get_logintype() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(login_type);
  // }

  Future<String?> get_token() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(token);
  }

  Future<String?> get_user_data() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userdetail);
  }

  Future<String?> get_address_data() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(address);
  }

  Future<String?> get_userfirstname() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userfirstname);
  }
  Future<String?> get_userlastname() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userlastname);
  }
  Future<String?> get_useremail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(useremail);
  }
  Future<String?> get_userimage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(userimage);
  }

  cleardata() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}