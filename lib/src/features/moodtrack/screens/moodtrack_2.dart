import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:moodup/src/constants/colors.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EmotionRecognitionScreen extends StatefulWidget {
  const EmotionRecognitionScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EmotionRecognitionScreenState createState() =>
      _EmotionRecognitionScreenState();
}

class _EmotionRecognitionScreenState extends State<EmotionRecognitionScreen> {
  // List of available cameras
  List<CameraDescription> cameras = [];

  // Selected camera
  CameraDescription? selectedCamera;

  // Camera controller
  CameraController? cameraController;

  // Image picker
  ImagePicker imagePicker = ImagePicker();

  // Picked image file
  XFile? pickedImage;

  // Show emoji keyboard flag
  bool showEmojiKeyboard = false;

  // Selected emoji
  String? selectedEmoji;

  @override
  void initState() {
    super.initState();
    // Initialize cameras
    initCameras();
  }

  @override
  void dispose() {
    // Dispose camera controller
    cameraController?.dispose();
    super.dispose();
  }

  // Initialize cameras
  Future<void> initCameras() async {
    // Get the list of available cameras
    cameras = await availableCameras();

    // Select the first camera as default
    selectedCamera = cameras.first;

    // Initialize the camera controller
    cameraController = CameraController(
      selectedCamera!,
      ResolutionPreset.high,
    );

    // Add a listener to update the UI when the camera is initialized
    cameraController!.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    // Initialize the camera
    await cameraController!.initialize();
  }

  // Switch camera
  Future<void> switchCamera() async {
    // Get the index of the selected camera
    int selectedCameraIndex = cameras.indexOf(selectedCamera!);

    // Increment the index by 1 and modulo by the length of cameras list
    selectedCameraIndex = (selectedCameraIndex + 1) % cameras.length;

    // Get the new camera from the list
    CameraDescription newCamera = cameras[selectedCameraIndex];

    // Create a new camera controller
    CameraController newCameraController = CameraController(
      newCamera,
      ResolutionPreset.high,
    );

    // Add a listener to update the UI when the camera is initialized
    newCameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    // Initialize the new camera
    await newCameraController.initialize();

    // Dispose the old camera controller
    await cameraController?.dispose();

    // Update the state with the new camera and controller
    setState(() {
      selectedCamera = newCamera;
      cameraController = newCameraController;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: kDarkGreen,
          title: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Emotional Regonize'),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Camera preview or picked image
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Center(
              child: SizedBox(
                width: 400.0,
                height: 500.0,
                child: Expanded(
                  flex: 3,
                  child: pickedImage == null
                      ? cameraController == null ||
                              !cameraController!.value.isInitialized
                          ? const Center(child: CircularProgressIndicator())
                          : CameraPreview(cameraController!)
                      : Image.file(File(pickedImage!.path)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
