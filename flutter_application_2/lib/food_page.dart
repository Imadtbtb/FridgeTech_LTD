// delivery_page.dart
import 'package:flutter/material.dart';
import 'base.dart';

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Text(
          'Food Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
