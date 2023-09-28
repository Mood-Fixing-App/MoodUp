import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/components/button.dart';
import 'package:moodup/src/features/consult/screens/consultbox.dart';
import 'package:moodup/src/features/notifications/notifications.dart';

class ConsultPage extends StatefulWidget {
  const ConsultPage({super.key});

  @override
  State<ConsultPage> createState() => _ConsultPageState();
}

class _ConsultPageState extends State<ConsultPage> {
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhite,
                    ),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: kLightBlack,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: kLightBlack,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
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

            const SizedBox(
              height: 10,
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
                          children: const [
                            Text(
                              'Categories',
                              style: TextStyle(
                                color: kBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection:
                                Axis.horizontal, // Horizontal scroll
                            children: const [
                              ConsultContainer(title: 'Career'),
                              ConsultContainer(title: 'Relationship'),
                              ConsultContainer(title: 'Education'),
                              ConsultContainer(title: 'Other'),
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
                              'Consultants',
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
                          decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: const [
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage('assets/images/slide1.png'),
                                ),
                                title: Text('Dr. Sanath Gunarathne'),
                                subtitle: Text('Psychologist'),
                              ),
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage('assets/images/slide2.png'),
                                ),
                                title: Text('Dr. Sanath Gunarathne'),
                                subtitle: Text('Psychologist'),
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
