import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the slot ID from the previous page
    final String slotId = ModalRoute.of(context)!.settings.arguments as String;

    // Controllers for the text fields
    final TextEditingController vehicleNumberController = TextEditingController();
    final TextEditingController additionalInfoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Booking Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display the selected slot ID
              Text(
                'Booking for Slot: $slotId',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Vehicle number input
              TextField(
                controller: vehicleNumberController,
                decoration: InputDecoration(
                  labelText: 'Enter Vehicle Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),

              // Image and additional information section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Example image (you can replace this with your actual image)
                  Icon(Icons.directions_car, size: 50, color: Colors.blue),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text('Vehicle Type', style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      TextField(
                        controller: additionalInfoController,
                        decoration: InputDecoration(
                          labelText: 'Enter Additional Info (optional)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),

              // "Make Booking" Button
              ElevatedButton(
                onPressed: () {
                  // Logic for making a booking
                  String vehicleNumber = vehicleNumberController.text;
                  String additionalInfo = additionalInfoController.text;

                  // Handle booking logic here (e.g., show a confirmation dialog)
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Booking Confirmed'),
                        content: Text(
                          'Vehicle Number: $vehicleNumber\nAdditional Info: $additionalInfo\nSlot ID: $slotId',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Make Booking'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
