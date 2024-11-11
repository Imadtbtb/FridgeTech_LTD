// contact_page.dart
import 'package:flutter/material.dart';
import 'base.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SingleChildScrollView( // Wrapping content in SingleChildScrollView to handle overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
            children: [
              // Contact Us Title centered at the top
              const Text(
                'Contact Us',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24), // Space between title and other elements

              // Introductory text in the center
              const Text(
                'We’re here to help! If you have any questions, feedback, or need support, please don’t hesitate to reach out.',
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24), // Space between text and form

              // Full Name input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
              const SizedBox(height: 16),

              // Email input field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
              const SizedBox(height: 16),

              // Message input field (larger box)
              TextField(
                maxLines: 6, // Larger input box for message
                decoration: InputDecoration(
                  labelText: 'Your Message',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
              const SizedBox(height: 24),

              // Send Button (centered)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your send functionality here
                  },
                  style: ElevatedButton.styleFrom(
                     backgroundColor: const Color.fromARGB(255, 184, 187, 190),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Send', style: TextStyle(fontSize: 16)),
                ),
              ),
              const SizedBox(height: 32), // Space before Support section

              // Support section title
              const Text(
                'Support',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // Support text below the title
              const Text(
                'For support inquiries, please fill out our support form or send us an email, and our team will respond as soon as possible.',
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
