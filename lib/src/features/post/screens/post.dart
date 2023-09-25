import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/features/post/screens/postcard.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<String> posts = [
    'Sample post 1',
    'Sample post 2',
    'Sample post 3',
  ];
  TextEditingController postTextController = TextEditingController();

  void _addPost(String text) {
    setState(() {
      posts.add(text);
      postTextController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        backgroundImage: AssetImage('assets/images/slide1.png'),
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
                              borderSide: BorderSide(color: kGreen),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hoverColor: kGreen,
                            suffixIcon: IconButton(
                              focusColor: kGreen,
                              icon: Icon(Icons.send),
                              onPressed: () {
                                String text = postTextController.text;
                                if (text.isNotEmpty) {
                                  _addPost(text);
                                }
                              },
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
                  child: ListView(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: PostCard(
                          avatarImage: 'assets/images/slide1.png',
                          authorName: 'Dr. Sanath Gunarathne',
                          authorSubtitle: 'Psychologist',
                          postText:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                          postImage: 'assets/images/slide1.png',
                          likes: 45,
                          comments: 23,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: PostCard(
                          avatarImage: 'assets/images/slide1.png',
                          authorName: 'Dr. Sanath Gunarathne',
                          authorSubtitle: 'Psychologist',
                          postText:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                          postImage: 'assets/images/slide1.png',
                          likes: 45,
                          comments: 23,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
