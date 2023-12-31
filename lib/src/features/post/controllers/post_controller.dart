import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moodup/src/constants/http.dart';
import 'package:moodup/src/features/post/models/postlist_model.dart';

class PostController extends GetxController {
  RxInt postsCount = 0.obs;
  PostListModel postList = PostListModel();

  get user => null;

  //Fetch posts from API and store them in postList
  Future fetchPosts() async {
    Uri url = Uri.parse(kAllPostsUrl);
    var response = await http.get(url);
    var responseJson = jsonDecode(response.body);
    if (jsonDecode(response.body)['status'] == 'success') {
      postsCount.value = jsonDecode(response.body)['posts'].length;
      postList = PostListModel.fromJson(responseJson);
      return postList;
    }
  }

  //Add a new post to the API
  Future addPost(String postText, String email) async {
    Uri url = Uri.parse(kAddPostUrl);
    await http.post(url, body: {"email": email, "content": postText});
    fetchPosts();
  }
}
