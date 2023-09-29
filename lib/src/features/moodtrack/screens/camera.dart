import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '../../../constants/colors.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
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
          print("Error initializing camera: $error");
          // Handle the initialization error here
        });
      } else {
        print("No cameras available");
        // Handle the case where no cameras are available
      }
    }).catchError((error) {
      print("Error getting available cameras: $error");
      // Handle the error when getting available cameras
    });
  }

  @override
  void dispose() {
    // Check if the controller is initialized before disposing
    if (_cameraController != null) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _cameraController != null && _cameraController.value.isInitialized
                ? CameraPreview(_cameraController)
                : CircularProgressIndicator(color: kGreen),
      ),
    );
  }
}
