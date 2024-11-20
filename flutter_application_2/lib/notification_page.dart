import 'package:flutter/material.dart';
 
class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color.fromARGB(255, 184, 187, 190),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildNotificationItem(
            "Your fridge temperature is too high!",
            "Adjust settings to avoid spoilage.",
            Icons.warning,
            Colors.red,
          ),
          _buildNotificationItem(
            "New recipe suggestions available!",
            "Check out the latest recipe ideas based on your stock.",
            Icons.fastfood,
            Colors.green,
          ),
          _buildNotificationItem(
            "Delivery update",
            "Your grocery delivery is on the way.",
            Icons.local_shipping,
            Colors.blue,
          ),
        ],
      ),
    );
  }
 
  Widget _buildNotificationItem(
    String title,
    String subtitle,
    IconData icon,
    Color iconColor,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey[600]),
        onTap: () {
          // Add onTap functionality if required
        },
      ),
    );
  }
}