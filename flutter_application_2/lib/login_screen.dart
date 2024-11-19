// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title Text
            const Text(
              'Login into your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),

            // Social login buttons in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Facebook Login Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Facebook login
                  },
                  icon: const Icon(Icons.facebook, color: Colors.white),
                  label: const Text(''),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),

                // Email Login Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Email login
                  },
                  icon: const Icon(Icons.email, color: Colors.white),
                  label: const Text(''),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                  ),
                ),

                // Apple Login Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Apple login
                  },
                  icon: const Icon(Icons.apple, color: Colors.white),
                  label: const Text(''),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32), // Spacing below the buttons

            // Custom Email and Password Fields
            CustomTextField(
              controller: emailController,
              labelText: 'Email',
              hintText: 'Enter your email',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              labelText: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
            ),
            const SizedBox(height: 32),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Handle login logic
              },
              child: const Text('Login'),
            ),

            // Register Button
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Don\'t have an account? Register'),
            ),

            // Chef Control Button (New Button)
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/chef_control'); // Navigate to Chef Control Panel
              },
              child: const Text('Chef Control'),
            ),

            // New Chef Control Panel Button
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/User_Management'); // Navigate to Chef Control Panel
              },
              child: const Text('User Management'),
            ),
          ],
        ),
      ),
    );
  }
}
