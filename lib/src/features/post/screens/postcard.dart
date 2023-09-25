import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String avatarImage;
  final String authorName;
  final String authorSubtitle;
  final String postText;
  final String postImage;
  final int likes;
  final int comments;

  const PostCard({
    required this.avatarImage,
    required this.authorName,
    required this.authorSubtitle,
    required this.postText,
    required this.postImage,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(12.0),
            leading: CircleAvatar(
              radius: 21,
              backgroundImage: AssetImage(avatarImage),
            ),
            title: Text(
              authorName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            subtitle: Text(
              authorSubtitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              postText,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Image.asset(
              postImage,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite),
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
