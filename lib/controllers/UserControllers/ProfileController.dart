import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plenum/views/UserSection/BottomNavUi.dart';
import '../../api/BaseProvider.dart';
import '../../constants/Networkconstants.dart';
import '../../constants/Stringconstants.dart';
import '../../utils/CommonToast.dart';
import '../../utils/Progressdialog.dart';
import '../../utils/Sharedutils.dart';
import 'package:http/http.dart' as http;

class Profilecontroller extends GetxController{
  var firstnameController=TextEditingController();
  var lastnameController=TextEditingController();
  var emailController=TextEditingController();
  var phonenumberController=TextEditingController();
  // var passwordcontroller=TextEditingController();
  final formKey = GlobalKey<FormState>();
  var profileimage = Rxn<File>();
  RxString selectedImage="".obs;
  final ImagePicker picker = ImagePicker();
  RxBool isObscured = true.obs;

  void togglePasswordVisibility() {
    isObscured.value = !isObscured.value;
  }
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    Future.microtask(() {
    });
  }

  void showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text(gallery_txt),
                  onTap: () {
                    pickImageFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text(camera_txt),
                  onTap: () {
                    pickImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> pickImageFromGallery() async {
   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
   if (pickedFile != null) {
     if (Platform.isAndroid) {
       CroppedFile? croppedFile = await ImageCropper().cropImage(
         sourcePath: pickedFile.path,
       );

       if (croppedFile != null) {
         profileimage.value = File(croppedFile.path);
         profileimage.refresh();
       }
     } else {
       // For other platforms (iOS, web, etc.), just assign the picked file
       profileimage.value = File(pickedFile.path);
       profileimage.refresh();
     }
   }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      if (Platform.isAndroid) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
        );

        if (croppedFile != null) {
          profileimage.value = File(croppedFile.path);
          profileimage.refresh();
        }
      } else {
        // For other platforms (iOS, web, etc.), just assign the picked file
        profileimage.value = File(pickedFile.path);
        profileimage.refresh();
      }
    }
  }

  // void updateTextFields() {
  //   if (productdata.value != null) {
  //     firstnameController.text = productdata.value?.data?.shopName ?? '';
  //     lastnameController.text = productdata.value?.data?.name ?? '';
  //     phonenumberController.text = productdata.value?.data?.phone ?? '';
  //     emailController.text = productdata.value?.data?.email ?? '';
  //     selectedImage.value = productdata.value?.data?.image ?? '';
  //   }
  // }

  Future<void> uploadImage(
      File file,
      String firstname,
      String lastname,
      String mobilenumber,
      String email,
      BuildContext context
      ) async {
    showProgressDialog(Get.context!);
    String? token = await SharedUtils().get_token();
    print("Token: $token");

    var headers = {
      "Authorization": "Bearer $token",
      // Remove Content-Type because it's automatically handled by MultipartRequest
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(vhBaseUrl + updateProfile),
    );

    request.fields['first_name'] = firstname.trim();
    request.fields['last_name'] = lastname.trim();
    request.fields['phone'] = mobilenumber.trim();
    request.fields['email'] = email.trim();
    request.files.add(await http.MultipartFile.fromPath(
      "image",
      file.path,
    ));
    request.headers.addAll(headers);
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        print("Request successful");
        hideprogressDialog(Get.context!);
        var responseBody = await response.stream.bytesToString();
        var jsonData = jsonDecode(responseBody);

        await SharedUtils().save_userfirstname(jsonData["data"]["first_name"] ?? "N/A");
        await SharedUtils().save_userlastname(jsonData["data"]["last_name"] ?? "N/A");
        await SharedUtils().save_useremail(jsonData["data"]["email"] ?? "N/A");
        await SharedUtils().save_userphone(jsonData["data"]["phone"] ?? "N/A");
        await SharedUtils().save_userimage(jsonData["data"]["image"] ?? "");

        success_toast(jsonData["message"]);
        Get.offAll(BottomNavScreen());
      } else {
        hideprogressDialog(Get.context!);
        // If the status code is not 200, handle error
        print("Request failed with status: ${response.statusCode}");
        var responseBody = await response.stream.bytesToString();
        print("Error response body: $responseBody");
        failed_toast("Failed to upload image");
        // var snackBar = SnackBar(content: Text("Failed to upload image"));
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print("Exception occurred: $e");
      failed_toast("An error occurred: $e");
      // var snackBar = SnackBar(content: Text("An error occurred: $e"));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> uploadwithoutImage(
      String firstname,
      String lastname,
      String mobilenumber,
      String email,
      BuildContext context
      ) async {
    showProgressDialog(Get.context!);
    String? token = await SharedUtils().get_token();
    print("Token: $token");

    var headers = {
      "Authorization": "Bearer $token",
      // Remove Content-Type because it's automatically handled by MultipartRequest
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(vhBaseUrl + updateProfile),
    );

    request.fields['first_name'] = firstname.trim();
    request.fields['last_name'] = lastname.trim();
    request.fields['phone'] = mobilenumber.trim();
    request.fields['email'] = email.trim();
    request.headers.addAll(headers);
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        hideprogressDialog(Get.context!);
        print("Request successful");
        var responseBody = await response.stream.bytesToString();
        var jsonData = jsonDecode(responseBody);
        await SharedUtils().save_userfirstname(jsonData["data"]["first_name"] ?? "N/A");
        await SharedUtils().save_userlastname(jsonData["data"]["last_name"] ?? "N/A");
        await SharedUtils().save_useremail(jsonData["data"]["email"] ?? "N/A");
        await SharedUtils().save_userphone(jsonData["data"]["phone"] ?? "N/A");

        success_toast(jsonData["message"]);
        Get.offAll(BottomNavScreen());
      } else {
        hideprogressDialog(Get.context!);
        // If the status code is not 200, handle error
        print("Request failed with status: ${response.statusCode}");
        var responseBody = await response.stream.bytesToString();
        print("Error response body: $responseBody");

        failed_toast("Failed to upload image");
      }
    } catch (e) {
      print("Exception occurred: $e");
      failed_toast("An error occurred: $e");
    }
  }
}