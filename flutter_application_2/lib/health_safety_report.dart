import 'package:flutter/material.dart';

class HealthSafetyReport extends StatefulWidget {
  @override
  _HealthSafetyReportState createState() => _HealthSafetyReportState();
}

class _HealthSafetyReportState extends State<HealthSafetyReport> {
  bool _checkbox1 = false;
  bool _checkbox2 = false;

  void _showConfirmationDialog() {
    // Reset the checkboxes to unchecked when the dialog
    setState(() {
      _checkbox1 = false;
      _checkbox2 = false;
    });

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: Text('Confirm Submission'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    title: Text(
                        'I confirm that I have read and understood the terms and conditions.'),
                    value: _checkbox1,
                    onChanged: (value) {
                      setStateDialog(() {
                        _checkbox1 = value ?? false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(
                        'I agree to submit the health and safety report with the provided information.'),
                    value: _checkbox2,
                    onChanged: (value) {
                      setStateDialog(() {
                        _checkbox2 = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_checkbox1 && _checkbox2) {
                      Navigator.of(context).pop(); // Close the dialog
                      // Submit the report
                      _submitReport();
                    } else {
                      // Show a message if not all checkboxes are checked
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Please confirm all terms before submitting.')),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _submitReport() {
    // Handle report submission here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Report Submitted Successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health and Safety Report'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Health and Safety Report',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              constraints: BoxConstraints(maxHeight: 250), // Restricting height
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: _buildTextField('Restaurant Name')),
                        SizedBox(width: 8),
                        Expanded(child: _buildTextField('Owner Name')),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                            child:
                                _buildTextField('Health and Safety Officer')),
                        SizedBox(width: 8),
                        Expanded(child: _buildTextField('Restaurant Address')),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(child: _buildTextField('Date')),
                        SizedBox(width: 8),
                        Expanded(child: _buildTextField('Manager Name')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Text(
                    '''
1. Introduction
This Health and Safety Report has been prepared to ensure that [Restaurant Name] operates in compliance with all relevant health and safety regulations. The report outlines the restaurant's commitment to providing a safe environment for both employees and customers by following industry standards and local regulations.
 
The key areas covered in this report include:
 
Food Safety and Hygiene Practices
Employee Health and Safety
Fire and Emergency Safety
Risk Assessment and Hazard Control
Health and Safety Training
Accident Reporting and Incident Management
2. Food Safety and Hygiene Practices
To ensure that food is safe to eat and prepared in a clean environment, the following practices are enforced:
 
2.1. Food Handling and Storage:
 
Temperature Control: All perishable foods are stored at the correct temperature (e.g., below 5°C for refrigeration and above 63°C for hot holding). Regular checks are conducted and documented to ensure that all refrigeration units and freezers maintain the correct temperatures.
FIFO System: The restaurant follows a "First In, First Out" (FIFO) system for stock rotation to prevent food from being used beyond its expiration date.
Separation of Raw and Cooked Foods: Raw meats and poultry are stored separately from cooked or ready-to-eat foods to prevent cross-contamination.
Proper Thawing Procedures: Frozen foods are thawed safely by refrigeration or under cold running water to avoid any risk of bacterial growth.
2.2. Hygiene and Cleanliness:
 
Personal Hygiene: All employees handling food are required to wash their hands regularly and wear appropriate uniforms (e.g., gloves, hairnets) while handling food. A strict policy is in place regarding hand-washing before and after handling raw food, after using the restroom, or after any potential contamination.
Cleaning Schedules: Regular cleaning schedules for kitchen surfaces, utensils, and equipment are established. A checklist is maintained to ensure compliance with sanitation standards.
Cleaning Supplies: Only approved cleaning agents and sanitizers are used in food prep areas. A clear distinction is made between cleaning materials used for food areas and those used for other parts of the restaurant.
2.3. Pest Control:
 
Prevention Measures: Regular pest control measures are in place, including sealing cracks and gaps, using pest-proof containers for food storage, and regular inspections.
Contracted Pest Control: A certified pest control service visits the premises regularly for professional monitoring and extermination services.
3. Employee Health and Safety
The restaurant is committed to ensuring the well-being of its employees by providing a safe working environment:
 
3.1. Employee Health Monitoring:
 
Medical Examinations: All staff, especially those handling food, undergo medical examinations to ensure they are free from communicable diseases. Employees showing symptoms of illness are prohibited from working with food.
Illness Policy: The restaurant has an illness policy that encourages employees to report any symptoms of illness, particularly gastrointestinal issues. Sick employees are instructed to stay home until they are symptom-free for at least 48 hours.
3.2. Employee Safety Equipment:
 
Personal Protective Equipment (PPE): Employees are provided with necessary PPE, such as gloves, aprons, hairnets, and non-slip footwear. PPE is required in areas where there is potential for injury or contamination.
First Aid Kit: A fully stocked first aid kit is available on the premises, with employees trained in basic first aid. The location of the first aid kit is clearly marked, and it is checked regularly to ensure that supplies are adequate and in date.
3.3. Workplace Safety:
 
Slips, Trips, and Falls: The restaurant maintains clear walkways, and non-slip mats are placed in areas prone to spills. Spills are cleaned up immediately.
Electrical Safety: All electrical equipment is regularly inspected to ensure it is in safe working order. Employees are trained in the safe use of equipment, and electrical outlets are protected from water and moisture exposure.
Manual Handling: Employees are trained in proper lifting techniques to prevent back and joint injuries. Heavy items are stored at waist height to minimize the risk of injury.
4. Fire and Emergency Safety
Ensuring the safety of employees and guests in case of a fire or emergency is a top priority:
 
4.1. Fire Safety Measures:
 
Fire Extinguishers: Fire extinguishers are strategically located throughout the restaurant, with a particular focus on high-risk areas such as the kitchen and storage rooms. All employees are trained in their use.
Fire Safety Training: Regular fire drills are conducted, and employees are trained on how to respond to various emergency situations. Evacuation procedures are clearly posted in all areas.
Smoke Detectors and Alarms: Smoke detectors are installed in key areas, including the kitchen and storage rooms, to detect fires early. Fire alarms are tested regularly.
4.2. Emergency Evacuation:
 
Evacuation Routes: Clear and well-marked evacuation routes are displayed throughout the restaurant. Emergency exits are kept unobstructed at all times.
Assembly Point: An assembly point outside the building is designated, where all employees and customers are to gather in the event of an emergency.
5. Risk Assessment and Hazard Control
The restaurant conducts regular risk assessments to identify and control potential hazards:
 
5.1. Hazardous Materials:
 
Chemical Storage: Cleaning chemicals and other hazardous materials are stored separately from food storage areas. All chemicals are clearly labeled with usage instructions and hazard symbols.
Safety Data Sheets (SDS): Safety Data Sheets are available for all chemicals and are easily accessible to all staff.
5.2. Equipment Safety:
 
Equipment Inspections: All kitchen equipment, including ovens, grills, and fryers, undergoes regular maintenance and safety checks to ensure safe operation. Faulty equipment is immediately taken out of service until repaired.
Training on Equipment Use: Staff members are trained in the proper use of kitchen equipment, particularly high-risk items such as knives, slicers, and fryers.
6. Health and Safety Training
Continuous training is essential to ensure the well-being of both employees and customers:
 
Ongoing Training: Health and safety training is conducted for all new hires, with regular refresher courses. Topics include food safety, personal hygiene, fire safety, and emergency procedures.
Accident Reporting and investigation: All workplace accidents, no matter how minor, must be reported immediately. An investigation is conducted to determine the cause, and corrective actions are implemented to prevent recurrence.
7. Conclusion
[Restaurant Name] is committed to providing a safe and healthy environment for its employees, customers, and visitors. Through regular training, thorough risk assessments, and the implementation of strict health and safety protocols, we aim to exceed industry standards and ensure the continued success of our operations.
                    ''',
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showConfirmationDialog,
              child: Text('Submit Request'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            border: OutlineInputBorder(),
            isDense: true,
          ),
        ),
      ],
    );
  }
}
