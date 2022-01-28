import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:clean_trash_app/styles.dart';
//import 'package:clean_trash_app/screens/home/home_screen.dart';

// FIX: the camera feature is running as the main app, need to make connect to the class buttons instead
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: const CameraPage(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CameraPage extends StatefulWidget {
  const CameraPage({ Key? key }) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  // Install Plugins
  // 1. Path Provider to get the path of files
  // 2. Image Picker that allows you to pick an image from different sources

  // Create a new object
  // ignore: unused_field
  File ? _image;
  // Create and instantiate our ImagePicker
  final ImagePicker imagePicker = ImagePicker();
  // Create a new function to get the Image from the camera
  Future getImage() async{
    // Allows us access the camera and get the picture
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      // assign the image path to our image File
      if (image != null) {
        _image = File(image.path);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: unnecessary_null_comparison
        child: _image == null ? const Text("No Images Selected") : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
