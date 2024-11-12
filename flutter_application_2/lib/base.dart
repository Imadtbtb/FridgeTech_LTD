import 'package:flutter/material.dart';
import 'food_page.dart';
import 'chef_control_panel.dart';
import 'home_page.dart';
import 'delivery_page.dart';
import 'contact_page.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;

  const BaseScreen({super.key, required this.child});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 2; // Default to Home page

  // List of pages to navigate to, using aliases to prevent import conflicts
  final List<Widget> _pages = [
    const FoodPage(),
    const ChefControlPanel(),
    const HomePage(),
    const DeliveryPage(),
    const ContactPage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 184, 187, 190),
        title: const Text("FFsmart Fridge "),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Add functionality for hamburger icon if needed
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Add functionality for notifications if needed
            },
          ),
        ],
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
}
