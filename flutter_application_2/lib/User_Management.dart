import 'package:flutter/material.dart';

class UserManagementPage extends StatefulWidget {
  @override
  _UserManagementPageState createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  List<Map<String, String>> users = [
    {'name': 'John Doe', 'jobTitle': 'Server', 'employeeId': 'E001'},
    {'name': 'Jane Smith', 'jobTitle': 'Chef', 'employeeId': 'E002'},
    {'name': 'Alex Johnson', 'jobTitle': 'Delivery Driver', 'employeeId': 'E003'},
  ];

  Map<String, String>? selectedUser;
  String? selectedJobTitle;

  final jobTitles = ['Chef', 'Sous Chef', 'Head Chef', 'Server', 'Delivery Driver'];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  String? newJobTitle;

  String getPermissions(String? jobTitle) {
    switch (jobTitle) {
      case 'Chef':
      case 'Sous Chef':
      case 'Head Chef':
        return 'This user is allowed to open the fridge and access all sections of the app apart from the delivery page.';
      case 'Delivery Driver':
        return 'This user is allowed to open the fridge and access only the delivery page, contact, and support sections.';
      case 'Server':
        return 'This user is not allowed to open the fridge but can access the contact and home pages only.';
      default:
        return 'No permissions assigned.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('User Management')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Access to this section is exclusively granted to the restaurant owner or manager, '
                      'who holds the authority to assign, revoke, and manage permissions.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),

                    // Centered Data Table with improved styling
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: DataTable(
                          columnSpacing: 20, // Space between columns
                          columns: [
                            DataColumn(
                              label: Text('Full Name', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DataColumn(
                              label: Text('Job Title', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            DataColumn(
                              label: Text('Employee ID', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                          rows: users.map((user) {
                            return DataRow(
                              color: MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors.grey[300];
                                  } else if (users.indexOf(user) % 2 == 0) {
                                    return Colors.grey[100]; // Alternate row colors
                                  }
                                  return null; // Default background color
                                },
                              ),
                              cells: [
                                DataCell(Text(user['name']!, style: TextStyle(color: Colors.black))),
                                DataCell(Text(user['jobTitle']!, style: TextStyle(color: Colors.black))),
                                DataCell(Text(user['employeeId']!, style: TextStyle(color: Colors.black))),
                              ],
                              selected: selectedUser == user,
                              onSelectChanged: (isSelected) {
                                setState(() {
                                  selectedUser = isSelected! ? user : null;
                                  selectedJobTitle = selectedUser?['jobTitle'];
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Centered Form for Adding a New Worker
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Add New Worker',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),

                          // Text field for the worker's name
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                labelText: 'Full Name',
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),

                          // Dropdown for assigning job title
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: DropdownButtonFormField<String>(
                              value: newJobTitle,
                              items: jobTitles.map((String jobTitle) {
                                return DropdownMenuItem<String>(
                                  value: jobTitle,
                                  child: Text(jobTitle),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                labelText: 'Job Title',
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  newJobTitle = newValue;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 8),

                          // Text field for employee ID
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              controller: idController,
                              decoration: InputDecoration(
                                labelText: 'Employee ID',
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),

                          // Button to add the new worker
                          ElevatedButton(
                            onPressed: () {
                              if (nameController.text.isNotEmpty &&
                                  newJobTitle != null &&
                                  idController.text.isNotEmpty) {
                                setState(() {
                                  users.add({
                                    'name': nameController.text,
                                    'jobTitle': newJobTitle!,
                                    'employeeId': idController.text,
                                  });
                                  nameController.clear();
                                  newJobTitle = null;
                                  idController.clear();
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // Dark color for the button
                            ),
                            child: Text('Add Worker', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    
                    // Instructional text
                    Text(
                      'Access to various pages of the app is restricted based on the job title designated by the owner or manager, '
                      'who controls and customizes permissions accordingly.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),

                    // Container for Selected User details and permissions
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected User:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text('Name: ${selectedUser != null ? selectedUser!['name'] : 'None'}'),
                          Text('Job Title: ${selectedUser != null ? selectedUser!['jobTitle'] : 'None'}'),
                          SizedBox(height: 16),

                          // Dropdown for changing job title
                          DropdownButton<String>(
                            value: selectedJobTitle,
                            items: jobTitles.map((String jobTitle) {
                              return DropdownMenuItem<String>(
                                value: jobTitle,
                                child: Text(jobTitle),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedJobTitle = newValue;
                                if (selectedUser != null) {
                                  selectedUser!['jobTitle'] = newValue!;
                                }
                              });
                            },
                          ),
                          SizedBox(height: 16),

                          // Display Permissions based on Job Title
                          Text(
                            'Permissions:',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            selectedUser != null ? getPermissions(selectedUser!['jobTitle']) : 'No permissions assigned.',
                            style: TextStyle(fontSize: 14),
                          ),

                          // Buttons: Save Changes and Delete Worker
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (selectedUser != null && selectedJobTitle != null) {
                                    setState(() {
                                      selectedUser!['jobTitle'] = selectedJobTitle!;
                                    });
                                  }
                                },
                                child: Text('Save Changes'),
                              ),
                              SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    users.remove(selectedUser);
                                    selectedUser = null;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 122, 122, 122), // Red color for delete
                                ),
                                child: Text('Delete Worker'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
