import 'package:flutter/material.dart';
import 'base.dart';
 
class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // QR Code Scanner and Driver Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // QR Code Scanner Placeholder
                  Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey[300],
                        child: const Center(child: Text('QR Code')),
                      ),
                      const SizedBox(height: 8),
                      const Text('Scan your QR code'),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Driver Details Card
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Profile Icon
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[400],
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Driver Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Driver\'s Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text('Driver\'s ID'),
                                SizedBox(height: 8),
                                Text('Phone: +44 754665224'),
                                Text('Driver\'s Email'),
                                Text('Supplier Name'),
                                SizedBox(height: 8),
                                Text('Date of Birth'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
 
              // Form Fields for Item Information
              const Text(
                'Item Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Expiry Date',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 16),
 
              // Upload Picture Section
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.upload),
                    label: const Text('Upload Picture'),
                  ),
                  const SizedBox(width: 8),
                  const Text('No file chosen'),
                ],
              ),
              const SizedBox(height: 24),
 
              // Add Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                  ),
                  child: const Text('ADD'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}