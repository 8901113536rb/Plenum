import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/Stringconstants.dart';

class Profilecontroller extends GetxController{
  var firstnameController=TextEditingController();
  var lastnameController=TextEditingController();
  var emailController=TextEditingController();
  var phonenumberController=TextEditingController();
  var passwordcontroller=TextEditingController();
  final formKey = GlobalKey<FormState>();
  var panImage = Rxn<File>();
  var profileimage = Rxn<File>();
  RxString selectedImage="".obs;
  RxString selectedPanImage="".obs;
  final ImagePicker picker = ImagePicker();
  final ImagePicker panPicker = ImagePicker();
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
  void showPanPicker(context) {
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
                    pickPanImageFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text(camera_txt),
                  onTap: () {
                    pickPanImageFromCamera();
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
  Future<void> pickPanImageFromGallery() async {
    final pickedFile = await panPicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (Platform.isAndroid) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
        );

        if (croppedFile != null) {
          panImage.value = File(croppedFile.path);
          panImage.refresh();
        }
      } else {
        // For other platforms (iOS, web, etc.), just assign the picked file
        panImage.value = File(pickedFile.path);
        panImage.refresh();
      }
    }
  }

  Future<void> pickPanImageFromCamera() async {
    final pickedFile = await panPicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (Platform.isAndroid) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
        );

        if (croppedFile != null) {
          panImage.value = File(croppedFile.path);
          panImage.refresh();
        }
      } else {
        // For other platforms (iOS, web, etc.), just assign the picked file
        panImage.value = File(pickedFile.path);
        panImage.refresh();
      }
    }
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

  void updateTextFields() {
    // if (productdata.value != null) {
    //   shopnameController.text = productdata.value?.data?.shopName ?? '';
    //   ownernameController.text = productdata.value?.data?.name ?? '';
    //   phonenumberController.text = productdata.value?.data?.phone ?? '';
    //   emailController.text = productdata.value?.data?.email ?? '';
    //   gstnumberController.text = productdata.value?.data?.gstNo ?? '';
    //   selectedImage.value = productdata.value?.data?.image ?? '';
    //   selectedPanImage.value = productdata.value?.data?.identity ?? '';
    // }
  }
  // void setImage(String? imagePath) {
  //   if (imagePath != null && imagePath.isNotEmpty) {
  //     File file = File(imagePath);
  //     if (file.existsSync()) {
  //       selectedImage.value = file;
  //       selectedImage.refresh();
  //       print('File exists and has been set.');
  //     } else {
  //       print('File does not exist at the given path.');
  //     }
  //   } else {
  //     print('Image path is null or empty');
  //   }
  // }
  // void setPanImage(String? imagePath) {
  //   if (imagePath != null && imagePath.isNotEmpty) {
  //     File file = File(imagePath);
  //     if (file.existsSync()) {
  //       selectedPanImage.value = file;
  //       selectedPanImage.refresh();
  //       print('File exists and has been set.');
  //     } else {
  //       print('File does not exist at the given path.');
  //     }
  //   } else {
  //     print('Image path is null or empty');
  //   }
  // }



}