import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/features/dashboard/controllers/dashboard_controller.dart';
import 'package:moodup/src/features/profile_picture_upload/controllers/profile_pic_upload_controller.dart';

class ProfilePictureUploadScreen extends StatelessWidget {
  const ProfilePictureUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfilePicUploadController>(tag: 'profilepic');
    final dcontroller = Get.find<DashboardController>(tag: 'dashboard');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Picture Upload',
            style: TextStyle(color: kWhite, fontWeight: FontWeight.bold)),
        backgroundColor: kLightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: controller.imagePath!.value == ''
                        ? const AssetImage('assets/images/default_profile.png')
                        : FileImage(File(controller.image!.path))
                            as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kLightGreen,
              ),
              child: const Text(
                'Pick a Profile Picture',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onPressed: () {
                controller.pickImage();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kLightGreen,
              ),
              child: const Text(
                'Upload Profile Picture',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onPressed: () {
                controller.uploadImage(dcontroller.user.value.email!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
