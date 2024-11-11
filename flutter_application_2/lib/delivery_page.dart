// delivery_page.dart
import 'package:flutter/material.dart';
import 'base.dart';

class DeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Center(
        child: Text(
          'Delivery Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
