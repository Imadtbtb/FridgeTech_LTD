import 'package:flutter/material.dart';
import 'base.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List<TableRow> itemsTableRows = [
    // Initial items in the table
    const TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Tomatoes'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('50 kg'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('12/12/2024'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Fresh Farms'),
        ),
      ],
    ),
  ];

  // Simulated new delivery item
  final newDeliveryItem = const TableRow(
    children: [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Lettuce'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('30 kg'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('05/01/2025'),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Eco Farms'),
      ),
    ],
  );

  void addItemToTable() {
    setState(() {
      itemsTableRows.add(newDeliveryItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        children: [
          // Centered title in top bar
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      'Inventory Management',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Search bar with pen icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search item',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    // Add your edit action here
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          // Main items table
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(2),
              },
              children: [
                // Header row
                const TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Item Name',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Quantity',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Expiry Date',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Supplier',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ...itemsTableRows,
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          // Action table with Add, Edit, Remove
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: const [
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Add',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Edit',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Remove',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          // New delivery item display
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New Delivery',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Image.asset(
                      'assets/lettuce.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Item Name: Lettuce'),
                        Text('Quantity: 30 kg'),
                        Text('Expiry Date: 05/01/2025'),
                        Text('Supplier: Eco Farms'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: addItemToTable,
                  child: const Text('Add to Inventory'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
