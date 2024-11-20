import 'package:flutter/material.dart';
import 'base.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List<TableRow> itemsTableRows = [
    const TableRow(
      children: [
        Padding(padding: EdgeInsets.all(8.0), child: Text('Tomatoes')),
        Padding(padding: EdgeInsets.all(8.0), child: Text('50 kg')),
        Padding(padding: EdgeInsets.all(8.0), child: Text('12/12/2024')),
        Padding(padding: EdgeInsets.all(8.0), child: Text('Fresh Farms')),
      ],
    ),
  ];

  void addItemToTable(
      String name, String quantity, String expiryDate, String supplier) {
    setState(() {
      itemsTableRows.add(
        TableRow(
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: Text(name)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(quantity)),
            Padding(
                padding: const EdgeInsets.all(8.0), child: Text(expiryDate)),
            Padding(padding: const EdgeInsets.all(8.0), child: Text(supplier)),
          ],
        ),
      );
    });
  }

  void addDeliveryToInventory() {
    addItemToTable("Lettuce", "30 kg", "05/01/2025", "Eco Farms");
  }

  void removeItemFromTable(String name) {
    setState(() {
      itemsTableRows.removeWhere((row) {
        final itemName = (row.children[0] as Padding).child as Text;
        return itemName.data == name;
      });
    });
  }

  void editItemInTable(String name, String field, String newValue) {
    setState(() {
      for (int i = 0; i < itemsTableRows.length; i++) {
        final row = itemsTableRows[i];
        final itemName = (row.children[0] as Padding).child as Text;
        if (itemName.data == name) {
          final updatedRow = row.children.map((cell) {
            if (field == 'Quantity' && cell == row.children[1]) {
              return Padding(
                  padding: const EdgeInsets.all(8.0), child: Text(newValue));
            } else if (field == 'Expiry Date' && cell == row.children[2]) {
              return Padding(
                  padding: const EdgeInsets.all(8.0), child: Text(newValue));
            } else if (field == 'Supplier' && cell == row.children[3]) {
              return Padding(
                  padding: const EdgeInsets.all(8.0), child: Text(newValue));
            }
            return cell;
          }).toList();
          if (updatedRow != null) {
            itemsTableRows[i] = TableRow(children: updatedRow);
          }
          break;
        }
      }
    });
  }

  Future<void> showAddDialog() async {
    String name = '';
    String quantity = '';
    String expiryDate = '';
    String supplier = '';

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Item Name'),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Quantity'),
                onChanged: (value) => quantity = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Expiry Date'),
                onChanged: (value) => expiryDate = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Supplier'),
                onChanged: (value) => supplier = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty &&
                    quantity.isNotEmpty &&
                    expiryDate.isNotEmpty &&
                    supplier.isNotEmpty) {
                  addItemToTable(name, quantity, expiryDate, supplier);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showRemoveDialog() async {
    String name = '';

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Remove Item'),
          content: TextField(
            decoration: const InputDecoration(labelText: 'Item Name'),
            onChanged: (value) => name = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                removeItemFromTable(name);
                Navigator.pop(context);
              },
              child: const Text('Remove'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showEditDialog() async {
    String name = '';
    String field = '';
    String newValue = '';

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Item Name'),
                onChanged: (value) => name = value,
              ),
              DropdownButtonFormField<String>(
                items:
                    ['Quantity', 'Expiry Date', 'Supplier'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) => field = value ?? '',
                decoration: const InputDecoration(labelText: 'Field to Edit'),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'New Value'),
                onChanged: (value) => newValue = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty &&
                    field.isNotEmpty &&
                    newValue.isNotEmpty) {
                  editItemInTable(name, field, newValue);
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Center(
              child: Text(
                'Inventory Management',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search inventory...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              onChanged: (value) {
                // Add logic to handle search here
                print('Search term: $value');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: showAddDialog, child: const Text('Add')),
                const SizedBox(width: 8.0),
                ElevatedButton(
                    onPressed: showEditDialog, child: const Text('Edit')),
                const SizedBox(width: 8.0),
                ElevatedButton(
                    onPressed: showRemoveDialog, child: const Text('Remove')),
              ],
            ),
          ),

          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(2)
              },
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Item Name',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Quantity',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Expiry Date',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Supplier',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
                ...itemsTableRows,
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'New Delivery',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Image.asset('assets/lettuce.jpg', width: 100, height: 100),
          const SizedBox(height: 8.0),
          const Text(
            'Lettuce - 30 kg - Expires: 05/01/2025 - Supplier: Eco Farms',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
              onPressed: addDeliveryToInventory,
              child: const Text('Add New Delivery to Inventory')),
        ],
      ),
    );
  }
}
