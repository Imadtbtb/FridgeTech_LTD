// lib/main.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
<<<<<<< HEAD
import 'chef_control_panel.dart'; // Import the new ChefControlPanel screen
=======
import 'chef_control_panel.dart';
import 'User_Management.dart';
>>>>>>> 9f57868c874126f2a51b4f40d271ebff4818f6e9

void main() {
  runApp(MyApp());
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
<<<<<<< HEAD
        '/chef_control': (context) =>
            const ChefControlPanel(), // Add route for Chef Control Panel
=======
        '/chef_control': (context) => ChefControlPanel(),
>>>>>>> 9f57868c874126f2a51b4f40d271ebff4818f6e9
      },
    );
  }
}
