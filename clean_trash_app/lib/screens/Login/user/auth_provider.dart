import 'package:cleantrash_app/screens/Login/user/auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends InheritedWidget {
  const AuthProvider({Key? key, required Widget child, required this.auth}) : super(key: key, child: child);
  final Auth auth;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }
}