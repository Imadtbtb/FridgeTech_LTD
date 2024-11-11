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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign up here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 52),

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
                    label: Text('Facebook'),
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
                    label: Text('Email'),
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
                    label: Text('Apple'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Form fields
              CustomTextField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: nameController,
                labelText: 'Name',
                hintText: 'Enter your name',
                obscureText: false,
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: surnameController,
                labelText: 'Surname',
                hintText: 'Enter your Surname',
                obscureText: false,
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: dobController,
                labelText: 'Date of Birth',
                hintText: 'Enter your date of birth',
                obscureText: false,
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: phonenumberController,
                labelText: 'Phone number',
                hintText: 'Enter your phone number',
                obscureText: false,
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
      ),
    );
  }
}
