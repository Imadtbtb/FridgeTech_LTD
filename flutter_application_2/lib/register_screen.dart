// lib/screens/register_screen.dart
import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign up here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 52),

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
                    label: const Text('Facebook'),
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
                    label: const Text('Email'),
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
                    label: const Text('Apple'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Form fields
              CustomTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: nameController,
                labelText: 'Name',
                hintText: 'Enter your name',
                obscureText: false,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: surnameController,
                labelText: 'Surname',
                hintText: 'Enter your Surname',
                obscureText: false,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: dobController,
                labelText: 'Date of Birth',
                hintText: 'Enter your date of birth',
                obscureText: false,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: phonenumberController,
                labelText: 'Phone number',
                hintText: 'Enter your phone number',
                obscureText: false,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: confirmPasswordController,
                labelText: 'Confirm Password',
                hintText: 'Re-enter your password',
                obscureText: true,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Handle register logic
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
