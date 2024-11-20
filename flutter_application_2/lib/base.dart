import 'package:flutter/material.dart';
import 'food_page.dart';
import 'chef_control_panel.dart';
import 'home_page.dart';
import 'delivery_page.dart';
import 'contact_page.dart';
import 'notification_page.dart'; // Import NotificationPage
import 'health_safety_report.dart';
import 'User_Management.dart';
import 'profile.dart';
import 'reordering_page.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
 
  const BaseScreen({super.key, required this.child});
 
  @override
  _BaseScreenState createState() => _BaseScreenState();
}
 
class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 2; // Default to Home page
 
  // List of pages to navigate to (for bottom navigation only)
  final List<Widget> _pages = [
    const FoodPage(),
    const ChefControlPanel(),
    const HomePage(),
    const DeliveryPage(),
    const ContactPage(),
    HealthSafetyReport(),
    UserManagementPage(),
    ReorderingPage(),
    ProfilePage(),

  ];
 
  // Navigation function for changing tabs
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }
 
  // Drawer navigation function
  void _onDrawerItemTapped(int index) {
    Navigator.pop(context); // Close the drawer
    _onItemTapped(index);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 184, 187, 190),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Path to your logo image
              height: 150, // Adjust size as needed
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 184, 187, 190),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40, // Adjust size of logo
                    backgroundImage:
                        AssetImage('assets/logo.png'), // Add your logo asset
                  ),
                  SizedBox(height: 10),
                  Text(
                    'FFsmart Fridge Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            _buildMenuItem(Icons.person, 'Profile', 7),
            _buildMenuItem(Icons.shopping_bag, 'Re-ordering', 8),
            _buildMenuItem(Icons.report, 'Health Safety', 5),
            _buildMenuItem(Icons.group, 'User Management', 6),
            _buildMenuItem(Icons.logout, 'Log out', 4),
          ],
        ),
      ),
      body: widget.child, // Show the passed-in child widget
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 184, 187, 190),
        selectedItemColor: const Color.fromARGB(255, 75, 72, 72),
        unselectedItemColor: const Color.fromARGB(164, 24, 23, 23),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Chef',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Delivery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
 
  Widget _buildMenuItem(IconData icon, String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 12.0, horizontal: 16.0), // Increased spacing
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300], // Darker background color
          borderRadius: BorderRadius.circular(8), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 4), // Shadow position
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 16, color: Colors.black), // Slightly larger font
          ),
          onTap: () => _onDrawerItemTapped(index),
        ),
      ),
    );
  }
}