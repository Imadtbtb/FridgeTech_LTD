import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Add your onPressed code here!
              print("Button Pressed!");
            },
            child: Text('Press t  Me'),
          ),
        ),
      ),
    );
  }
}
