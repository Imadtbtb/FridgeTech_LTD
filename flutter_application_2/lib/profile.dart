import 'package:flutter/material.dart';
 
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Profile"),
        centerTitle: true,
        actions: [Icon(Icons.notifications)],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person, // Profile icon
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Change and edit your profile",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            _buildTextField(label: "First Name", icon: Icons.edit),
            SizedBox(height: 10),
            _buildTextField(label: "Family Name", icon: Icons.edit),
            SizedBox(height: 10),
            _buildTextField(label: "Phone Number", icon: Icons.edit),
            SizedBox(height: 10),
            _buildTextField(label: "Email Address", icon: Icons.edit),
            SizedBox(height: 10),
            _buildTextField(label: "Date of Birth", icon: Icons.edit),
            SizedBox(height: 10),
            _buildTextField(
              label: "Password",
              icon: Icons.edit,
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
 
  Widget _buildTextField(
      {required String label,
      required IconData icon,
      bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
    );
  }
}