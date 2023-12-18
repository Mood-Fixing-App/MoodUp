import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MoodController extends GetxController {
  void getNews() {
    Uri uri = Uri.parse(
        "https://newsapi.org/v2/everything?q=mindfulness%20meditation%20AND%20anxiety&from=2023-12-17&to=2023-12-17&sortBy=popularity&apiKey=6c2c5629c8844017a0a000f66db839da");
    http.get(uri);
  }
}
