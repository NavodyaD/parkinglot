import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int? selectedSlotId;
  List<int> slotIds = [201, 202, 427, 428];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slotIds.map((slotId) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedSlotId = slotId;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedSlotId == slotId ? Colors.blue : Colors.grey,
                  ),
                  child: Text('Slot $slotId'),
                ),
              );
            }).toList(),
          ),

          Expanded(
            child: selectedSlotId != null
                ? StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('BookingDetails')
                  .where('parkingSlotId', isEqualTo: selectedSlotId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var bookings = snapshot.data!.docs;

                if (bookings.isEmpty) {
                  return Center(child: Text('No bookings for Slot $selectedSlotId'));
                }

                return ListView.builder(
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    var data = bookings[index].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text('Vehicle: ${data['vehicleNumber']}'),
                      subtitle: Text('Date: ${data['date']} | Time: ${data['time']}'),
                      leading: Icon(Icons.local_parking, color: Colors.blue),
                    );
                  },
                );
              },
            )
                : Center(child: Text('Select a parking slot')),
          ),
        ],
      ),
    );
  }
}
