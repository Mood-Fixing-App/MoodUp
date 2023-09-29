import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'package:flutter/foundation.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;

  @override
  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.isNotEmpty) {
        _cameraController =
            CameraController(cameras[0], ResolutionPreset.medium);
        _cameraController.initialize().then((_) {
          if (!mounted) {
            return;
          }
          setState(() {});
        }).catchError((error) {
          if (kDebugMode) {
            print("Error initializing camera: $error");
          }
          // Handle the initialization error here
        });
      } else {
        if (kDebugMode) {
          print("No cameras available");
        }
        // Handle the case where no cameras are available
      }
    }).catchError((error) {
      if (kDebugMode) {
        print("Error getting available cameras: $error");
      }
      // Handle the error when getting available cameras
    });
  }

  @override
  void dispose() {
    // Check if the controller is initialized before disposing
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _cameraController.value.isInitialized
            ? CameraPreview(_cameraController)
            : const CircularProgressIndicator(color: kGreen),
      ),
    );
  }
}