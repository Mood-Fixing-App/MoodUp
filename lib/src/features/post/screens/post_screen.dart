import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/features/post/screens/postcard.dart';
import 'package:moodup/src/features/post/controllers/post_controller.dart';
import 'package:moodup/src/features/dashboard/controllers/dashboard_controller.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostPageState();
}

class _PostPageState extends State<PostScreen> {
  PostController controller = Get.find<PostController>(tag: 'post');

  TextEditingController postTextController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  DashboardController dcontroller =
      Get.find<DashboardController>(tag: 'dashboard');

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: handlePullToRefresh,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Posts")),
          backgroundColor: kGreen,
        ),
        backgroundColor: kWhite,
        body: SafeArea(
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
                        FutureBuilder(
                          future: dcontroller.emailShared(),
                          builder: (context, snaphot) {
                            if (!snaphot.hasData) {
                              return const Center(child: Text("No Data"));
                            }

                            return Expanded(
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
                                    onPressed: () {
                                      controller.addPost(
                                          postTextController.text,
                                          snaphot.data!);
                                      postTextController.clear();
                                      _focusNode.unfocus();
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: controller.fetchPosts(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("No Post Yet"),
                    );
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Obx(
                        () => ListView.builder(
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
                  );
                },
              )
            ],
          ),
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
