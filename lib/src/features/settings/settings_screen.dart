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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            subtitle: Text('Edit Profile, Change Password'),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.lightbulb_outline),
            title: Text('Dark Mode'),
            subtitle: Text('Switch between light and dark modes'),
            trailing: Switch(
              value: _getOption2Value(),
              onChanged: (bool newValue) {
                _setOption2Value(newValue);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.timer),
            title: Text('Mood Tracking'),
            subtitle: Text(
              'Mood reminder, Mood log time',
            ),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text(
              'Choose your preferred app language.',
            ),
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(Icons.help),
            title: Text('About and Help'),
            subtitle: Text('App Version, Help Center'),
            onTap: () {},
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
