import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:moodup/src/constants/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodup/src/features/register/models/user.dart';


class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  var user = User().obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchUser();
  }

  // Function to change the selected tab
  onTabChange(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(selectedIndex.value);
  }

  Future<String> emailShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    return email.toString();
  }

  fetchUser() async {
    String email = await emailShared();

    Uri url = Uri.parse('$kLoggedInUserUrl$email');
    var response = await http.get(url);
    user.value = User.fromJson(jsonDecode(response.body)['user']);
    return user;
  }

  Future<List<Map<String, dynamic>>> fetchArticleDetails() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=mindfulness%20meditation%20AND%20anxiety&from=2023-12-17&to=2023-12-17&sortBy=popularity&apiKey=6c2c5629c8844017a0a000f66db839da'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final articles = jsonData['articles'];

      if (articles is List) {
        return List<Map<String, dynamic>>.from(articles);
      } else {
        throw Exception(
            'Invalid data format: Articles key not found or not a list');
      }
    } else {
      throw Exception('Failed to load article details');
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
      // Handle the case where the response body is empty
      return null;
    }
  } else {
    // Handle the case where the HTTP request fails
    return null;
  }
}
}
