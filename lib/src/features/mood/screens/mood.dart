import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/components/button.dart';
import 'package:moodup/src/features/mood/screens/emotion.dart';
import 'package:moodup/src/features/mood/screens/tile.dart';
import 'package:moodup/src/features/notifications/notifications.dart';
import 'package:moodup/src/features/dashboard/controllers/dashboard_controller.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({Key? key}) : super(key: key);

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  final List<String> exercises = [
    'Exercise 1',
    'Exercise 2',
    'Exercise 3',
    'Exercise 4',
    'Exercise 5',
    'Exercise 6',
  ];
  final controller = Get.find<DashboardController>(tag: 'dashboard');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreen,
      body: SafeArea(
        child: FutureBuilder(
          future: controller.fetchUser(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                children: [
                  // greetings row
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // avatar
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage('assets/images/slide1.png'),
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            // Hi, John!
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hi, ${controller.user.value.name!.split(' ')[0]}",
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),

                            // Notification Icon
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationsScreen(),
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
                          height: 50,
                        ),

                        //  how do you feel
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'How do you feel?',
                              style: TextStyle(
                                color: kWhite,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
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

                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
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
                                children: [
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
                                children: [
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
                                children: [
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
                      ],
                    ),
                  ),

                  Expanded(
                    child: Container(
                      color: kWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Exercises',
                                      style: TextStyle(
                                        color: kBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.more_horiz),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          2, // You can adjust the number of columns as needed
                                      crossAxisSpacing: 16.0,
                                      mainAxisSpacing: 16.0,
                                    ),
                                    itemCount: exercises.length,
                                    itemBuilder: (context, index) {
                                      return ExerciseTile(
                                          exerciseName: exercises[index]);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
