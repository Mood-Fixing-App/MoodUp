import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/components/button.dart';
import 'package:moodup/src/features/mood/screens/tile.dart';
import 'package:moodup/src/features/mood/screens/emotion.dart';
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
      //drawer: showDrawer(controller.user.value.name!),
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
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: CircleAvatar(
                              radius: 20,
                            ),
                          ),
                        ),
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
                  ),

                  //  how do you feel
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
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
                  ),

                  // moods

                  Padding(
                    padding: const EdgeInsets.all(25.0),
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

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: kWhite,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Center(
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
                                  SingleChildScrollView(
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
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
                    ],
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

Widget showDrawer(String name) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: kLightGreen,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 40,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  name,
                  style: const TextStyle(
                    color: kBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text('Item 1'),
          onTap: () {},
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {},
        ),
      ],
    ),
  );
}
