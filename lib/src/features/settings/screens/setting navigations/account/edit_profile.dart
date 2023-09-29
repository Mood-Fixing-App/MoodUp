import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String fullName = "John Doe";
  String email = "john.doe@example.com";
  String dob = "January 1, 1990";
  String bio = "I'm a passionate Flutter developer.";

  @override
  Widget build(BuildContext context) {
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
                backgroundImage: AssetImage('assets/default_profile.png'),
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
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(labelText: 'Date of Birth'),
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
              onPressed: () {
                // Add logic to save changes to the database
                // You can use the updated values of fullName, email, dob, and bio here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Set the button color to green
              ),
              child: const Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
