import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoRecording extends StatefulWidget {
  const VideoRecording({super.key});

  @override
  State<VideoRecording> createState() => _VideoRecordingState();
}

class _VideoRecordingState extends State<VideoRecording> {
  bool _hasPermission = false;
  Future<void> intPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;
    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      setState(() {
        _hasPermission = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(),
    );
  }
}
