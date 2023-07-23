import 'package:flutter/material.dart';
import 'package:moodup/constants/colors.dart';
import '../constants/sizes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
              Icon(Icons.arrow_back),
              SizedBox(width: 8),
              Text('Settings'),
            ],
          ),
        ),
      ),
      body: _buildSettingsList(),
    );
  }

  Widget _buildSettingsList() {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(Sizes.kDefaultPadding),
          child: ListTile(
            title: Text('Account'),
            subtitle: Text('Edit Profile, Change Password'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(Sizes.kDefaultPadding),
          child: ListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Switch between light and dark modes'),
            trailing: Switch(
              value:
                  _getOption2Value(), // Implement this method to get the saved value
              onChanged: (bool newValue) {
                _setOption2Value(
                    newValue); // Implement this method to save the new value
              },
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(Sizes.kDefaultPadding),
          child: ListTile(
            title: Text('Mood Tracking'),
            subtitle: Text(
                'Set a specific time to receive daily reminders for mood tracking, choose the time of day you prefer to log your mood.'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(Sizes.kDefaultPadding),
          child: ListTile(
            title: Text('Language'),
            subtitle: Text(
                'Choose your preferred app language from a list of available languages.'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(Sizes.kDefaultPadding),
          child: ListTile(
            title: Text('About and Help'),
            subtitle: Text('App Version, Help Center'),
          ),
        ),
      ],
    );
  }

  bool _getOption1Value() {
    return false;
  }

  void _setOption1Value(bool newValue) {}

  bool _getOption2Value() {
    return true;
  }

  void _setOption2Value(bool newValue) {}
}
