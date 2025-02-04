import 'package:flutter/material.dart';
import 'package:parkinglot/screens/user/slot_booking_page.dart';
import 'package:parkinglot/screens/user/slot_tile.dart';

import '../../../services/slotstate_services.dart';

class ParkingDetailsLocation2 extends StatefulWidget {
  @override
  State<ParkingDetailsLocation2> createState() => _ParkingDetailsPageState();
}

class _ParkingDetailsPageState extends State<ParkingDetailsLocation2> {


  final SlotService slotService = SlotService();
  final String car_park_name = "Kandy Car Park";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(car_park_name)),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 8, right: 8),
              decoration: BoxDecoration(
                color: Color(0xFFAEC5C2),
                border: Border.all(color: Color(0xFF7FB5B0), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2 slots as a row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildParkingSlot(427),
                      SizedBox(width: 8),
                      _buildParkingSlot(428),
                    ],
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ],
        )
    );
  }

  // build slots
  Widget _buildParkingSlot(int slotNum) {
    return StreamBuilder<String>(
      stream: slotService.getSlotStatus(slotNum),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading slot details'));
        }

        String slotStatus = snapshot.data ?? "available";

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingPage(slotId: slotNum),
              ),
            );
          },
          child: Container(
            height: 100,
            width: 100,
            child: ParkingSlotWidget(
              slotStatus: slotStatus,
              slotNumber: slotNum,
            ),
          ),
        );
      },
    );
  }
}
