//import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'HomePage.dart';
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Image Picker Demo',
//      debugShowCheckedModeBanner: false,
//      home:HomePage() ,
//    );
//  }
//}

import 'package:cleantrash_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'home_view.dart';

void main() {
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
