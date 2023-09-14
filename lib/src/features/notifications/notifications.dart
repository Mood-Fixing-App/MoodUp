import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
              Text('Notifications'),
            ],
          ),
        ),
      ),
      body: _buildSettingsList(context),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Reminder: Log Your Mood'),
          subtitle: const Text('It\'s time to log your daily mood.'),
          onTap: () {
            // Handle tapping on the notification
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('New Mood Insights'),
          subtitle: const Text('Check out your new mood analysis.'),
          onTap: () {
            // Handle tapping on the notification
          },
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Update: MoodFix App'),
          subtitle: const Text('A new version of the MoodFix app is available.'),
          onTap: () {
            // Handle tapping on the notification
          },
        ),
        // Add more notifications here
      ],
    );
  }
}
