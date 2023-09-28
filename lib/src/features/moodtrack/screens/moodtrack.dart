import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'package:moodup/src/components/button.dart';
import 'package:moodup/src/features/notifications/notifications.dart';


class MoodTrackPage extends StatefulWidget {
  const MoodTrackPage({Key? key}) : super(key: key);

  @override
  State<MoodTrackPage> createState() => _MoodTrackPageState();
}

class _MoodTrackPageState extends State<MoodTrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreen,
      body: SafeArea(
        child: Column(
          children: [
            // greetings row
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/slide1.png'),
                      ),

                      // Spacer to push icons to the right
                      const Spacer(),

                      // Notification Icon
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationsScreen(),
                            ),
                          );
                        },
                        child: const MyButton(
                          iconData: Icons.notifications,
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

                        // Moods
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: kGreen,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(
                                    72), // Increase this value to make the container larger
                                child: const Center(
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 30,
                                    color: kWhite,
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
