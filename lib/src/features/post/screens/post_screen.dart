import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/features/post/screens/postcard.dart';
import 'package:moodup/src/features/post/controllers/post_controller.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostPageState();
}

class _PostPageState extends State<PostScreen> {
  PostController controller = Get.find<PostController>(tag: 'post');

  TextEditingController postTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: handlePullToRefresh,
      child: Scaffold(
        backgroundColor: kWhite,
        body: FutureBuilder(
          future: controller.fetchPosts(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/slide1.png'),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: postTextController,
                                decoration: InputDecoration(
                                  hintText: 'What\'s on your mind?',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: kGreen),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hoverColor: kGreen,
                                  suffixIcon: IconButton(
                                    focusColor: kGreen,
                                    icon: const Icon(Icons.send),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.builder(
                        itemCount: controller.postsCount.value,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PostCard(
                              index: index,
                              authorName: controller
                                          .postList.posts?[index].author ==
                                      null
                                  ? 'Null'
                                  : controller.postList.posts![index].author!,
                              postText:
                                  controller.postList.posts![index].content!,
                              likes: controller.postList.posts![index].likes!,
                              comments:
                                  controller.postList.posts![index].comments!,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> handlePullToRefresh() async {
    setState(() {
      controller.fetchPosts();
    });
  }
}
