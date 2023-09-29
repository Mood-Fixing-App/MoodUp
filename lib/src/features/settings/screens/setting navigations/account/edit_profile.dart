import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/settings/controllers/setting_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<SettingController>(tag: 'setting');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String fullName =
              controller.user.name == null ? "Null" : controller.user.name!;
          String email =
              controller.user.email == null ? "Null" : controller.user.email!;
          String dob = controller.user.dob == null ? "" : controller.user.dob!;
          String bio = controller.user.bio == null ? "" : controller.user.bio!;

          ///////////////////////////////////////////////////////
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 212, 243, 216),
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
              elevation: 0,
              title: const Text(
                'Edit Profile',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Add logic to change the profile picture
                    },
                    child: const CircleAvatar(
                      radius: 60,
                      //backgroundImage: AssetImage('assets/default_profile.png'),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    controller: TextEditingController(text: fullName),
                    onChanged: (value) {
                      fullName = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    controller: TextEditingController(text: email),
                    readOnly: true,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration:
                        const InputDecoration(labelText: 'Date of Birth'),
                    controller: TextEditingController(text: dob),
                    onChanged: (value) {
                      dob = value;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Bio'),
                    controller: TextEditingController(text: bio),
                    onChanged: (value) {
                      bio = value;
                    },
                    maxLines: null,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                   await controller.updateUserData(
                          name: fullName, dob: DateTime.now(), bio: bio);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Set the button color to green
                    ),
                    child: const Text('Save Profile'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}