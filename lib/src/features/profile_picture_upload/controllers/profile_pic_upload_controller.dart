import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moodup/src/constants/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodup/src/features/settings/screens/setting%20navigations/account/edit_profile.dart';
// ignore_for_file: unused_element


class ProfilePicUploadController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  File? image;
  XFile? pickedImage;
  RxString? imagePath = ''.obs;
  File? uploadedImage;

  void pickImage() async {
    pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imagePath!.value = pickedImage!.path;
      image = File(pickedImage!.path);
    }
  }

  void uploadImage(String email) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(kUploadImageUrl),
    );
    request.fields['email'] = email;
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        image!.path,
      ),
    );
    final response = await request.send();
    if (response.statusCode == 200) {
      Get.defaultDialog(
        title: 'Image Upload',
        middleText: 'Image uploaded successfully!',
        confirmTextColor: Colors.amberAccent,
        barrierDismissible: false,
        onCancel: () => Get.off(() => const EditProfileScreen()),
        textCancel: 'OK');
    }
    else{
      Get.defaultDialog(
        title: 'Image Upload',
        middleText: 'Image upload failed!',
        confirmTextColor: Colors.amberAccent,
        barrierDismissible: false,
        onCancel: () => Get.off(() => const EditProfileScreen()),
        textCancel: 'OK');
    }

    Future<String> emailShared() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('email');
      return email.toString();
    }

    fetchUserImage() async {
      String email = "hashand379@gmail.com";
      Map<String, dynamic> request = {
        "email": email,
      };
      Uri url = Uri.parse(kShowImageUrl);

      var response = await http.post(url, body: request);
      uploadedImage = response.body as File;
      if (kDebugMode) {
        print(response.body);
      }
      return response.body;
    }
  }
}
