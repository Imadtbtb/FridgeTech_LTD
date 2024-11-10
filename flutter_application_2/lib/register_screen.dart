// lib/screens/register_screen.dart
import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: emailController,
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              labelText: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: confirmPasswordController,
              labelText: 'Confirm Password',
              hintText: 'Re-enter your password',
              obscureText: true,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle register logic
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
