// lib/main.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'chef_control_panel.dart';
import 'User_Management.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Start with the LoginScreen
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/chef_control': (context) => ChefControlPanel(),
      },
    );
  }
}
