import 'package:cleantrash_app/screens/Login/login_page.dart';
import 'package:cleantrash_app/screens/Login/user/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'Login/login_page.dart';
//import 'user/auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth>(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.green,
        ),
        home: LoginPage(),
      ),
    );
  }
}