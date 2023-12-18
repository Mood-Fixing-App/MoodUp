import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moodup/src/constants/http.dart';
import 'package:moodup/src/servivces/api_services.dart';
import 'package:moodup/src/features/settings/models/user_model.dart';

class SettingController extends GetxController {
  var apiservices = Get.find<APIServices>(tag: 'api');
  late String? email;
  User user = User();

  Future<User> fetchUserData() async {
    email = await apiservices.showLoggedinUserEmail();
    var response = await apiservices.showAnUser(email: email);
    user = User.fromJson(jsonDecode(response)['user']);
    return user;
  }

  Future updateUserData({String? name, DateTime? dob, String? bio}) async {
    var response = await apiservices.updateAnUser(name: name, bio: bio);
    if (response.statusCode == 200) {
      Get.defaultDialog(
        title: "Success",
        middleText: "Profile updated successfully",
        onConfirm: () {
          Get.back();
        },
      );
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: "Profile update failed",
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  Future<Uint8List?> fetchUserImage(String email) async {
    Uri url = Uri.parse(kLoggedInUserImageUrl);
    var response = await http.post(url, body: {"email": email});

    if (response.statusCode == 200) {
      // Check if the response body is not empty
      if (response.body.isNotEmpty) {
        // Decode the base64-encoded image data to a Uint8List
        Uint8List bytes = response.bodyBytes;
        return bytes;
      } else {
        print("error");
        return null;
      }
    } else {
      print("error");
      return null;
    }
  }
}
