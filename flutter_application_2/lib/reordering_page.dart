import 'package:flutter/material.dart';
 
class ReorderingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Reordering Page"),
        centerTitle: true,
        actions: [Icon(Icons.notifications)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You may manually select any item and reorder as desired; otherwise, the system will automatically initiate an order three days prior to each product's expiration.",
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(4, (index) {
                  return _buildProductPlaceholder();
                }),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Supplier details: supplier@email.com",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Placeholder for reorder action
                },
                child: Text("Reorder"),
              ),
            ),
          ],
        ),
      ),
    );
  }
 
  Widget _buildProductPlaceholder() {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.grey[300],
            child: Center(
              child: Icon(Icons.image, size: 40, color: Colors.grey),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Product Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "Expiry Date",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}