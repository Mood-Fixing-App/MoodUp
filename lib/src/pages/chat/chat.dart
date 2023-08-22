import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: kDarkGreen,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('MoodUp'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {
                // Handle call button press
              },
            ),
            IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {
                // Handle video call button press
              },
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle overflow menu item selection
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'view_contact',
                    child: Text('View contact'),
                  ),
                  PopupMenuItem(
                    value: 'media',
                    child: Text('Media, links, and docs'),
                  ),
                  PopupMenuItem(
                    value: 'search',
                    child: Text('Search'),
                  ),
                  PopupMenuItem(
                    value: 'mute',
                    child: Text('Mute notifications'),
                  ),
                  PopupMenuItem(
                    value: 'wallpaper',
                    child: Text('Wallpaper'),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace this with the actual number of chat messages
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.lightGreen[100],
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('lib/images/google.png'),
            ),
            title: Text('Hello!'),
            subtitle: Text('12:34 PM'),
          );
        },
      ),
    );
  }
}
