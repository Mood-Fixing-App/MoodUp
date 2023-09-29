import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodup/src/features/login/screens/login_screen.dart';
import 'package:moodup/src/features/settings/screens/setting%20navigations/account/edit_profile.dart';
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

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  static List<Setting> settingsItem = [
    const Setting(
      title: 'Profile',
      subtitle: 'Edit profile',
      icon: Icons.person,
    ),
    const Setting(
      title: 'Security',
      subtitle: 'Change password',
      icon: Icons.security,
    ),
    const Setting(
      title: 'App Settings',
      subtitle: 'Notification, Themes',
      icon: Icons.settings,
    ),
    const Setting(
      title: 'Log Out',
      subtitle: 'Sign out of your account',
      icon: Icons.exit_to_app,
    ),
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
          'Account',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: settingsItem.length,
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
                  leading: Icon(settingsItem[index].icon),
                  title: Text(settingsItem[index].title),
                  subtitle: Text(settingsItem[index].subtitle),
                  onTap: () {
                    if (index < 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NextScreen(index)),
                      );
                    } else {
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
        return const EditProfileScreen();
      case 1:
        return const SecurityScreen();
      case 2:
        return const AppSettingScreen();
      case 3:
       

      default:
        throw Exception('Invalid index');
    }
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
      ),
      body: const Center(
        child: Text('Security Screen'),
      ),
    );
  }
}

class AppSettingScreen extends StatelessWidget {
  const AppSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
      ),
      body: const Center(
        child: Text('App Settings Screen'),
      ),
    );
  }
}
