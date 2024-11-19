// lib/main.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'chef_control_panel.dart'; // Import the new ChefControlPanel screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/chef_control': (context) => //yhyhyh
            const ChefControlPanel(), // Add route for Chef Control Panel
      },
    );
  }
}
