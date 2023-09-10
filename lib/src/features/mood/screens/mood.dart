import 'package:flutter/material.dart';
import 'package:moodup/src/components/button.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/features/mood/screens/Emo.dart';
import 'package:moodup/src/features/notifications/notifications.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // greetings row
              Row(
                children: [
                  // Hi, John!
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, John!',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Spacer to push icons to the right
                  const Spacer(),

                  // Notification Icon
                  InkWell(
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

              const SizedBox(
                height: 25,
              ),

              //  how do you feel
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'How do you feel?',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: kWhite,
                  ),
                ],
              ),

              const SizedBox(
                height: 25,
              ),

              // moods

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Emo(
                          emo: '😕',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Bad',
                          style: TextStyle(color: kWhite),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Emo(
                          emo: '😄',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Happy',
                          style: TextStyle(color: kWhite),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Emo(
                          emo: '😃',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Fine',
                          style: TextStyle(color: kWhite),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Emo(
                          emo: '😮',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Wonder',
                          style: TextStyle(color: kWhite),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Detect your mood',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: kWhite,
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),

              // moods

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(120),
                      child: Center(
                        child: Icon(
                          Icons.camera_alt_rounded,
                          size: 60,
                          color: kDarkGreen,
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
    );
  }
}
