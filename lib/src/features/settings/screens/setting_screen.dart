import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/settings/screens/setting%20navigations/help.dart';
import 'package:moodup/src/features/settings/screens/setting%20navigations/privacy.dart';
import 'package:moodup/src/features/settings/screens/setting%20navigations/language.dart';
import 'package:moodup/src/features/settings/screens/setting%20navigations/new_account.dart';
// ignore: file_names


class Setting {
  final String title;
  final String subtitle;
  final bool isToggleable;
  final IconData icon;

  const Setting({
    required this.title,
    required this.icon,
    required this.subtitle,
    this.isToggleable = false,
  });
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isNightMode = false;

  static List<Setting> settings = [
    const Setting(
        title: 'Account',
        subtitle: 'Edit your profile',
        icon: Icons.person_4_rounded),
    const Setting(
      title: 'Dark Mode',
      subtitle: 'Toggle day/night mode',
      isToggleable: true,
      icon: Icons.mode,
    ),
    const Setting(
        title: 'Mood Tracking',
        subtitle: 'Switch between light and dark modes',
        icon: Icons.mood),
    const Setting(
        title: 'Language',
        subtitle: 'Security notifications, change number',
        icon: Icons.language),
    const Setting(
        title: 'About & Help',
        subtitle: 'Security notifications, change number',
        icon: Icons.help),

    // ... other settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 243, 216),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: settings.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Card(
                color:
                    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: Icon(settings[index].icon),
                  title: Text(settings[index].title),
                  subtitle: Text(settings[index].subtitle),
                  trailing: settings[index].isToggleable
                      ? Switch(
                          value: isNightMode,
                          onChanged: (newValue) {
                            
                            setState(() {
                              Get.changeThemeMode(
                                newValue ? ThemeMode.dark : ThemeMode.light);
                              isNightMode = newValue;
                              // Implement your logic to switch between day and night mode here
                            });
                          },
                          activeColor: const Color.fromARGB(255, 18, 167,
                              67), // Color of the toggle thumb when on
                          inactiveTrackColor: Colors.grey,
                        )
                      : const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    if (!settings[index].isToggleable) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NextScreen(index)),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  final int index;

  const NextScreen(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    // Render the appropriate screen based on the index
    switch (index) {
      case 0:
        return const AccountScreen();
      case 1:
        return Container();
      case 2:
        return const PrivacyScreen();
      case 3:
        return const LanguageScreen();
      case 4:
        return const HelpScreen();
      default:
        throw Exception('Invalid index');
    }
  }
}
