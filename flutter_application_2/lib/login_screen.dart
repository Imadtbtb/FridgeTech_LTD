// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title Text
            Text(
              'Login into your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),

            // Social login buttons in a row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Facebook Login Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Facebook login
                  },
                  icon: Icon(Icons.facebook, color: Colors.white),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),

                // Email Login Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Email login
                  },
                  icon: Icon(Icons.email, color: Colors.white),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[700],
                  ),
                ),

                // Apple Login Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Apple login
                  },
                  icon: Icon(Icons.apple, color: Colors.white),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
              ],
            ),

            SizedBox(height: 32), // Spacing below the buttons
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
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Handle login logic
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
