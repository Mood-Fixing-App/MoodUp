import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/post/controllers/post_controller.dart';

class PostCard extends StatelessWidget {
  final String? avatarImage;
  final String authorName;
  final String? authorSubtitle;
  final String postText;
  final String? postImage;
  final int? likes;
  final int? comments;
  final int index;

  const PostCard({
    Key? key,
    required this.index,
    this.avatarImage,
    required this.authorName,
    this.authorSubtitle,
    required this.postText,
    this.postImage,
    this.likes,
    this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostController controller = Get.find<PostController>(tag: 'post');
    var postList = controller.postList.posts;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(12.0),
            leading: const CircleAvatar(
              radius: 21,
              //backgroundImage: AssetImage(avatarImage!),
            ),
            title: Text(
              authorName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            // subtitle: Text(
            //   authorSubtitle!,
            //   style: const TextStyle(
            //     color: Colors.grey,
            //     fontSize: 14.0,
            //   ),
            // ),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'edit') {
                  // Show Edit Dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Edit Post'),
                        content: Column(
                          children: const [
                            TextField(
                              decoration:
                                  InputDecoration(labelText: 'New Post Text'),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Save'),
                            onPressed: () {
                              // Save the edited post logic here
                              // For example:
                              // String newPostText = _controller.text;
                              // Perform save action and update the post
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else if (value == 'delete') {}
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  postText,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          if (postList![index].images != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Image.asset(
                postImage!,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite),
                    Text(likes.toString()),
                  ],
                ),
                Row(
                  children: [
                    Text('$comments comments'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
