// delivery_page.dart
import 'package:flutter/material.dart';
import 'base.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
      child: Center(
        child: Text(
          'Delivery Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
