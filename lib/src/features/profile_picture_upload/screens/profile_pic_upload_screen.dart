import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/features/profile_picture_upload/controllers/profile_pic_upload_controller.dart';

class ProfilePictureUploadScreen extends StatelessWidget {
  const ProfilePictureUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfilePicUploadController>(tag: 'profilepic');
    return Scaffold(
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
            TextButton(
              child: const Text('Pick a Profile Picture'),
              onPressed: () {
                controller.pickImage();
              },
            ),
            TextButton(
              child: const Text('Upload Profile Picture'),
              onPressed: () {
                controller.uploadImage();
              },
            ),
            TextButton(
              child: const Text('Show Picture'),
              onPressed: () {
                controller.fetchUserImage();
              },
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: controller.uploadedImage == null
                      ? const AssetImage('assets/images/default_profile.png')
                      : Image.memory(controller.uploadedImage!).image,
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
