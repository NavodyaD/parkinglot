import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class BookingPage extends StatelessWidget {
  final String slotId;

  BookingPage({required this.slotId});

  @override
  Widget build(BuildContext context) {
    // Controllers for text fields
    final TextEditingController vehicleNumberController = TextEditingController();
    final TextEditingController paymentKeyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Booking Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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

            // Payment key input
            TextField(
              controller: paymentKeyController,
              decoration: InputDecoration(
                labelText: 'Enter Payment Key',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 30),

            // 'Make Booking' Button
            ElevatedButton(
              onPressed: () async {
                // Get the details and get the current date and time
                String vehicleNumber = vehicleNumberController.text;
                String paymentKey = paymentKeyController.text;
                String bookingId = DateTime.now().millisecondsSinceEpoch.toString();
                String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
                String formattedTime = DateFormat('HH:mm:ss').format(DateTime.now());

                // Store the booking details in Firebase Firestore
                try {
                  await FirebaseFirestore.instance.collection('BookingDetails').add({
                    'bookingId': bookingId,
                    'vehicleNumber': vehicleNumber,
                    'date': formattedDate,
                    'time': formattedTime,
                    'parkingSlotId': slotId,
                    'paymentKey': paymentKey,
                  });

                  // Show confirmation msg
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Booking Confirmed'),
                        content: Text(
                          'Booking ID: $bookingId\nVehicle Number: $vehicleNumber\nDate: $formattedDate\nTime: $formattedTime\nSlot ID: $slotId\nPayment Key: $paymentKey',
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
                } catch (e) {
                  // Handle any errors
                  print('Error saving your slot booking: $e');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('There was an error saving your booking. Please try again.'),
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
                }
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
    );
  }
}
