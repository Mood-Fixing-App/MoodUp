import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('No'),
                    onPressed: () {
                      //!Error on this Line
                      Get.off(false);
                    },
                  ),
                  TextButton(
                    child: const Text('Yes, exit'),
                    onPressed: () {
                      //!Error on this Line
                      Get.off(true);
                    },
                  ),
                ],
              );
            });
        return value == true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard Screen'),
        ),
        body: const Center(
          child: Text('DashboardScreen is working'),
        ),
        bottomNavigationBar: const GNav(tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.feed,
            text: 'Posts',
          ),
          GButton(
            icon: Icons.face,
            text: 'Mood',
          ),
          GButton(
            icon: Icons.chat,
            text: 'Chat',
          ),
        ],
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        gap: 8,
        ),
      ),
    );
  }
}
