import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moodup/src/features/mood/screens/mood.dart';
import 'package:moodup/src/features/post/screens/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodup/src/features/consult/screens/consult.dart';
import 'package:moodup/src/features/settings/screens/setting_screen.dart';
import 'package:moodup/src/features/dashboard/controllers/dashboard_controller.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardController controller =
      Get.find<DashboardController>(tag: 'dashboard');
  DashboardController controller =
      Get.find<DashboardController>(tag: 'dashboard');

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: PageView(
          controller: controller.pageController,
          children: const [
            MoodPage(),
            ConsultPage(),
            PostPage(),
            SettingScreen(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          child: GNav(
            backgroundColor: kWhite,
            color: kDarkGreen,
            activeColor: kDarkGreen,
            tabActiveBorder: Border.all(
              color: kDarkGreen, // Set the tab border color to kDarkGreen
              width: 2.0, // Set the tab border width as needed
            ),
            gap: 8,
            onTabChange: (index) => controller.onTabChange(index),
            padding: const EdgeInsets.all(10),
            selectedIndex: controller.selectedIndex.value,
            tabs: const [
              GButton(
                icon: Icons.mood,
                text: 'Mood',
              ),
              GButton(
                icon: Icons.chat,
                text: 'Chat',
              ),
              GButton(
                icon: Icons.post_add,
                text: 'Post',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
    return Obx(
      () => Scaffold(
        body: PageView(
          controller: controller.pageController,
          children: const [
            MoodPage(),
            ConsultPage(),
            PostPage(),
            SettingScreen(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          child: GNav(
            backgroundColor: kWhite,
            color: kDarkGreen,
            activeColor: kDarkGreen,
            tabActiveBorder: Border.all(
              color: kDarkGreen, // Set the tab border color to kDarkGreen
              width: 2.0, // Set the tab border width as needed
            ),
            gap: 8,
            onTabChange: (index) => controller.onTabChange(index),
            padding: const EdgeInsets.all(10),
            selectedIndex: controller.selectedIndex.value,
            tabs: const [
              GButton(
                icon: Icons.mood,
                text: 'Mood',
              ),
              GButton(
                icon: Icons.chat,
                text: 'Chat',
              ),
              GButton(
                icon: Icons.post_add,
                text: 'Post',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
