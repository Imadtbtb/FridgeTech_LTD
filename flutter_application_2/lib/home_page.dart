// home.dart
import 'package:flutter/material.dart';
import 'base.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Title at the top-center
              const Text(
                'Home Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // Spacing between title and row

              // Three containers in a row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Keeps fixed gaps
                children: [
                  // Task 1 Container
                  Expanded(
                    child: Container(
                      height: 200, // Increased height
                      margin: const EdgeInsets.symmetric(horizontal: 8.0), // Fixed gaps
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Same color for all
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Task 1',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Output 1',
                            style: TextStyle(color: Colors.black),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  // Task 2 Container
                  Expanded(
                    child: Container(
                      height: 200, // Increased height
                      margin: const EdgeInsets.symmetric(horizontal: 8.0), // Fixed gaps
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Same color for all
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Task 2',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Output 2',
                            style: TextStyle(color: Colors.black),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  // Task 3 Container
                  Expanded(
                    child: Container(
                      height: 200, // Increased height
                      margin: const EdgeInsets.symmetric(horizontal: 8.0), // Fixed gaps
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Same color for all
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Task 3',
                              style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Output 3',
                            style: TextStyle(color: Colors.black),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Spacing between row and big container

              // Big container with two tables
              Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity, // Expands to the available width
                color: Colors.grey[300],
                child: Column(
                  children: [
                    // First Table: Staff Shift Schedule
                    const Center(
                      child: Text(
                        'Staff Shift Schedule',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity, // Ensures the table matches the container width
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Shift', style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Hours', style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: [
                          DataRow(
                            color: MaterialStateProperty.resolveWith<Color?>(
                              (states) => Colors.grey[200], // Alternating row color
                            ),
                            cells: const [
                              DataCell(Text('John Doe')),
                              DataCell(Text('Morning')),
                              DataCell(Text('8 hrs')),
                            ],
                          ),
                          DataRow(
                            cells: const [
                              DataCell(Text('Jane Smith')),
                              DataCell(Text('Afternoon')),
                              DataCell(Text('8 hrs')),
                            ],
                          ),
                          DataRow(
                            color: MaterialStateProperty.resolveWith<Color?>(
                              (states) => Colors.grey[200],
                            ),
                            cells: const [
                              DataCell(Text('Robert Brown')),
                              DataCell(Text('Night')),
                              DataCell(Text('6 hrs')),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20), // Spacing between tables

                    // Second Table: Delivery History
                    const Center(
                      child: Text(
                        'Delivery History',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity, // Ensures the table matches the container width
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Order ID', style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: [
                          DataRow(
                            color: MaterialStateProperty.resolveWith<Color?>(
                              (states) => Colors.grey[200], // Alternating row color
                            ),
                            cells: const [
                              DataCell(Text('1001')),
                              DataCell(Text('2024-11-19')),
                              DataCell(Text('Delivered')),
                            ],
                          ),
                          DataRow(
                            cells: const [
                              DataCell(Text('1002')),
                              DataCell(Text('2024-11-18')),
                              DataCell(Text('Pending')),
                            ],
                          ),
                          DataRow(
                            color: MaterialStateProperty.resolveWith<Color?>(
                              (states) => Colors.grey[200],
                            ),
                            cells: const [
                              DataCell(Text('1003')),
                              DataCell(Text('2024-11-17')),
                              DataCell(Text('Cancelled')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
