import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/features/consult/screens/consult.dart';
import 'package:moodup/src/features/mood/screens/mood.dart';
import 'package:moodup/src/features/post/screens/post.dart';
import 'package:moodup/src/features/settings/screens/settings_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Current selected tab index
  PageController _pageController = PageController(initialPage: 0);

  // Function to change the selected tab
  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          MoodPage(),
          ConsultPage(),
          PostPage(),
          SettingsPage(),
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
          onTabChange: _onTabChange,
          padding: const EdgeInsets.all(10),
          selectedIndex: _selectedIndex,
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
    );
  }
}
