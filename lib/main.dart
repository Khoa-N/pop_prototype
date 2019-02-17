import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'src/navigation/handlers.dart';
import 'package:fluro/fluro.dart';

final router = Router();
List<CameraDescription> cameras;

Future<Null> main() async {
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    //logError(e.code, e.description);
  }
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    defineRoutes(router);
    return MaterialApp(
      title: 'pop_prototype',
      onGenerateRoute: router.generator,
    );
  }
}
