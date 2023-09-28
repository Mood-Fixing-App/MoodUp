import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void uploadImage() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://king-prawn-app-zrp6n.ondigitalocean.app/api/user/profile/image/update'),
    );
    request.fields['email'] = 'hashand379@gmail.com';
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        image!.path,
      ),
    );
    final response = await request.send();
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print('Uploaded!');
      }
    } else {
      if (kDebugMode) {
        print('Error!');
      }
    }
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
    Uri url = Uri.parse(
        'https://king-prawn-app-zrp6n.ondigitalocean.app/api/user/profile/image/show');

    var response = await http.post(url, body: request);
    uploadedImage = response.body as File;
    if (kDebugMode) {
      print(response.body);
    }
    return response.body;
  }
}
