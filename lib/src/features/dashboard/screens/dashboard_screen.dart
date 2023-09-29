import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moodup/src/features/mood/screens/mood.dart';
import 'package:moodup/src/features/consult/screens/consult.dart';
import 'package:moodup/src/features/post/screens/post_screen.dart';
import 'package:moodup/src/features/moodtrack/screens/moodtrack.dart';
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

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: PageView(
          controller: controller.pageController,
          children: const [
            MoodPage(),
            ConsultPage(),
            MoodTrackPage(),
            PostScreen(),
            SettingScreen(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          child: GNav(
            backgroundColor: kWhite,
            color: kGreen,
            activeColor: kGreen,
            tabActiveBorder: Border.all(
              color: kGreen,
              width: 2.0,
            ),
            gap: 8,
            onTabChange: (index) => controller.onTabChange(index),
            padding: const EdgeInsets.all(10),
            selectedIndex: controller.selectedIndex.value,
            tabs: const [
              GButton(
                icon: Icons.mood,
              ),
              GButton(
                icon: Icons.chat_outlined,
              ),
              GButton(
                icon: Icons.camera_alt_outlined,
                iconSize: 48,
              ),
              GButton(
                icon: Icons.post_add_outlined,
              ),
              GButton(
                icon: Icons.settings_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
