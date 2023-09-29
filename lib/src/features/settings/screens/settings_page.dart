import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodup/src/features/settings/screens/language.dart';
import 'package:moodup/src/features/login/screens/login_screen.dart';
import 'package:moodup/src/features/settings/screens/abouthelp.dart';
import 'package:moodup/src/features/settings/screens/moodtracking.dart';
import 'package:moodup/src/features/settings/screens/account_settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kDarkGreen,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Settings'),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Account'),
            subtitle: const Text('Edit Profile, Change Password'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const AccountPage()), // Navigate to AccountPage
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.lightbulb_circle_sharp), // Leading Icon
            title: const Text('Dark Mode'),
            subtitle: const Text('Switch between light and dark modes'),
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
            leading: const Icon(Icons.timer),
            title: const Text('Mood Tracking'),
            subtitle: const Text('Mood reminder, Mood log time'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MoodTrackingPage()), // Navigate to AccountPage
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            subtitle: const Text('Choose your preferred app language.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const LanguagePage()), // Navigate to AccountPage
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              Get.defaultDialog(
                title: 'Logout',
                middleText: 'Are you sure you want to logout?',
                textConfirm: 'Yes',
                textCancel: 'No',
                confirmTextColor: kWhite,
                buttonColor: kDarkGreen,
                cancelTextColor: kDarkGreen,
                onConfirm: () async {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.remove('email');
                  Get.offAll(() => const LoginScreen());
                },
                onCancel: () {},
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.help),
            title: const Text('About and Help'),
            subtitle: const Text('App Version, Help Center'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const AboutHelpPage()), // Navigate to AccountPage
              );
            },
          ),
        ),
      ],
    );
  }

  bool _getOption2Value() {
    return false;
  }

  void _setOption2Value(bool newValue) {}
}
