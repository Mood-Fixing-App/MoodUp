import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'package:moodup/src/features/moodtrack/screens/camera.dart';
import 'package:moodup/src/features/notifications/notifications.dart';
import 'package:moodup/src/features/dashboard/controllers/dashboard_controller.dart';

class MoodTrackPage extends StatelessWidget {
  const MoodTrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardController controller =
        Get.find<DashboardController>(tag: 'dashboard');
    return Scaffold(
      backgroundColor: kGreen,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      FutureBuilder(
                        future: controller
                            .fetchUserImage(controller.user.value.email!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CircleAvatar(
                              radius: 20,
                              backgroundImage: snapshot.data != null
                                  ? Image.memory(snapshot.data!).image
                                  : null,
                            );
                          } else {
                            return const CircleAvatar(
                              radius: 20,
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationsScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: kWhite,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Let\'s find your mood',
                              style: TextStyle(
                                color: kBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: kBlack,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CameraScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kGreen,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(72),
                                  child: const Center(
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      size: 30,
                                      color: kWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
