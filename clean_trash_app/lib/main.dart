import 'package:cleantrash_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home/home_view.dart';
import 'dart:async';
import 'dart:io';

//import 'package:camera/camera.dart';
Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
//
  //// Obtain a list of the available cameras on the device.
  //final cameras = await availableCameras();
//
  //// Get a specific camera from the list of available cameras.
  //final firstCamera = cameras.first;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean_Trash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
