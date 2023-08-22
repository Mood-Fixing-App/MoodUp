import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/pages/notifications/notifications.dart';
import 'package:moodup/pages/settings/settings_page.dart';

class MoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkGreen,
        title: Text('MoodUp'),
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NotificationsScreen()), // Navigate to SettingsPage
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SettingsPage()), // Navigate to SettingsPage
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: Colors.lightGreen[100],
      ),
    );
  }
}
