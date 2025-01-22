import 'package:flutter/material.dart';
import 'package:parkinglot/screens/user/slot_booking_page.dart';

class ParkingDetailsPage extends StatefulWidget {
  @override
  State<ParkingDetailsPage> createState() => _ParkingDetailsPageState();
}

class _ParkingDetailsPageState extends State<ParkingDetailsPage> {

  // slot IDs
  final String slotId1 = 'G11';
  final String slotId2 = 'G12';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parking Page')),
      body: Container(
        color: Colors.blueGrey[50],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // G11 parking slot
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/booking', arguments: slotId1);
                },
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.orange, // Bg color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    slotId1,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // G12 parking slot
              GestureDetector(
                onTap: () {
                  // Pass the slotId when navigating to BookingPage
                  String slotId = 'G11'; // Replace with your dynamic slot ID
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingPage(slotId: slotId),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black), // Border
                    color: Colors.green, // Background color of the container
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    slotId2,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
