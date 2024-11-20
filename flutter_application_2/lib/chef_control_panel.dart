import 'package:flutter/material.dart';
import 'base.dart'; // Assuming BaseScreen is defined in base.dart
 
class ChefControlPanel extends StatelessWidget {
  const ChefControlPanel({super.key});
 
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text("Chef Control Panel"),
          centerTitle: true,
          actions: const [Icon(Icons.notifications)],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chef Control Panel',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              _buildFridgeStatus(),
              const SizedBox(height: 20),
              _buildActionHistory(),
              const SizedBox(height: 20),
              _buildAssignTasks(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }
 
  Widget _buildFridgeStatus() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Fridge Status: Active",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Temperature: -10 °C"),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fridge Door:"),
                      Switch(value: true, onChanged: null), // Fixed for now
                    ],
                  ),
                  SizedBox(height: 8),
                  Text("Next delivery: 10/10/2024"),
                  Text("Last delivery: 12/04/2024"),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Working Labour: 10%", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text("Food Wastage: 20%", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text("Sous Chef: John", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text("Line Chef: Mohammed", style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text("Staff Number: 10", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
 
  Widget _buildActionHistory() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Actions History",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Divider(),
            _buildActionItem("Sarah (Head Chef) added 3kg of salmon",
                "11:00 AM, Oct 16, 2024"),
            _buildActionItem("Supplier replenished 15 bottles of milk",
                "9:45 AM, Oct 16, 2024"),
            _buildActionItem(
                "John (Chef) removed 10 eggs", "10:30 AM, Oct 16, 2024"),
          ],
        ),
      ),
    );
  }
 
  Widget _buildActionItem(String action, String timestamp) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(action),
          Text(timestamp,
              style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
 
  Widget _buildAssignTasks() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Assign Tasks",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(labelText: "Add Note"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Enter Staff Name"),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Choose the Task"),
              items: const [
                DropdownMenuItem(
                    value: "Reorganize Shelf", child: Text("Reorganize Shelf")),
                DropdownMenuItem(
                    value: "Clean Fridge", child: Text("Clean Fridge")),
                DropdownMenuItem(
                    value: "Check Expiry Dates",
                    child: Text("Check Expiry Dates")),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Assign"),
            ),
          ],
        ),
      ),
    );
  }
 
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      onTap: (index) {},
    );
  }
}