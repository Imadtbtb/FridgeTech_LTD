// chef_control_panel.dart
import 'package:flutter/material.dart';
import 'base.dart';

class ChefControlPanel extends StatelessWidget {
  const ChefControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Chef Control Panel',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Container 1 with #dddddd color
            Container(
              height: 150,
              width: double.infinity,
              color: const Color(0xFFDDDDDD),
              margin: const EdgeInsets.only(bottom: 20),
              child: const Center(
                child: Text(
                  'Container 1',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            // Container 2 with #dddddd color and title "Action History"
            Container(
              height: 150,
              width: double.infinity,
              color: const Color(0xFFDDDDDD),
              margin: const EdgeInsets.only(bottom: 20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Action History',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Container 3 with #eeeeee color and title "Assign Tasks"
            Container(
              height: 150,
              width: double.infinity,
              color: const Color(0xFFEEEEEE),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Assign Tasks',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
