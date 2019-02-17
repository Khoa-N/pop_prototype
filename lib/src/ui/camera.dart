import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:pop_prototype/main.dart';

class CameraScreen extends StatefulWidget {
  List<CameraDescription> cameras;

  CameraScreen(this.cameras);
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  String imagePath;
  bool _toggleCamera = false;
  bool _startRecording = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  CameraController controller;
  final timeout = const Duration(seconds: 7);
  final ms = const Duration(milliseconds: 1);

  String videoPath;
  VoidCallback videoPlayerListener;

  @override
  void initState() {
    try {
      onCameraSelected(widget.cameras[0]);
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cameras.isEmpty) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Text(
          'No Camera Found!',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      );
    }

    if (!controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            CameraPreview(controller),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 120.0,
                padding: EdgeInsets.all(20.0),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          onTap: () {
                            !_startRecording
                                ? onVideoRecordButtonPressed()
                                : onStopButtonPressed();
                            setState(() {
                              _startRecording = !_startRecording;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              !_startRecording ? Icons.play_arrow : Icons.stop,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // !_startRecording ? _getToggleCamera() : new Container(),
                    _getToggleCamera()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getToggleCamera() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        onTap: () {
          !_toggleCamera
              ? onCameraSelected(widget.cameras[1])
              : onCameraSelected(widget.cameras[0]);
          setState(() {
            _toggleCamera = !_toggleCamera;
          });
        },
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: Icon(Icons.switch_camera),
        ),
      ),
    );
  }

  void onCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) await controller.dispose();
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showSnackBar('Camera Error: ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showException(e);
    }

    if (mounted) setState(() {});
  }

  String timestamp() => new DateTime.now().millisecondsSinceEpoch.toString();

  String fixVideoPath(String vidPath) {
    List<String> pathlist = vidPath.split("/");
    String newPath = '';
    for (int i = 1; i < pathlist.length; i++) {
      newPath = newPath + pathlist[i];
      if (i < pathlist.length - 1) {
        newPath += "*";
      }
    }
    return newPath;
  }

  void setCameraResult() {
    print("Recording Done!");
    router.navigateTo(context, '/VideoPlayer/${fixVideoPath(videoPath)}');
  }

  void onVideoRecordButtonPressed() {
    print('onVideoRecordButtonPressed()');
    startVideoRecording().then((String filePath) {
      if (mounted) setState(() {});
      if (filePath != null) showSnackBar('Saving video to $filePath');
    });
  }

  void onStopButtonPressed() {
    stopVideoRecording().then((_) {
      if (mounted) setState(() {});
      showSnackBar('Video recorded to: $videoPath');
    });
  }

  Future<String> startVideoRecording() async {
    if (!controller.value.isInitialized) {
      showSnackBar('Error: select a camera first.');
      return null;
    }

    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Videos';
    await new Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (controller.value.isRecordingVideo) {
      return null;
    }

    try {
      videoPath = filePath;
      await controller.startVideoRecording(filePath);
      startTimeout();
    } on CameraException catch (e) {
      _showException(e);
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showException(e);
      return null;
    }

    setCameraResult();
  }

  void _showException(CameraException e) {
    logError(e.code, e.description);
    showSnackBar('Error: ${e.code}\n${e.description}');
  }

  void showSnackBar(String message) {
    print(message);
  }

  void logError(String code, String message) =>
      print('Error: $code\nMessage: $message');

  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    onStopButtonPressed();
  }
}
