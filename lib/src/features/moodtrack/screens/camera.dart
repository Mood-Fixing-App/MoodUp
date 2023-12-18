import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'package:flutter/foundation.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    _initializeCameraController();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeCameraController(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: _cameraController.value.isInitialized
                  ? CameraPreview(_cameraController)
                  : const Text('Camera Initialization Failed',
                      style: TextStyle(color: Colors.red)),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(color: kGreen));
          }
        },
      ),
    );
  }

  Future<void> _initializeCameraController() async {
    // ignore: unnecessary_null_comparison
    if (_cameraController == null) {
      try {
        cameras = await availableCameras();
        if (cameras.isNotEmpty) {
          _cameraController =
              CameraController(cameras[0], ResolutionPreset.medium);
          await _cameraController.initialize();
        } else {
          // Handle the case where no cameras are available
          if (kDebugMode) {
            print("No cameras available");
          }
        }
      } catch (e) {
        // Handle the error when initializing camera
        if (kDebugMode) {
          print("Error initializing camera: $e");
        }
      }
    }
  }
}
