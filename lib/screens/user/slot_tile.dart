import 'package:flutter/material.dart';

class ParkingSlotTile extends StatelessWidget {
  final int slotNumber;
  final String slotStatus;

  ParkingSlotTile({required this.slotNumber, required this.slotStatus});

  @override
  Widget build(BuildContext context) {
    // define color and image visibility based on slotStatus
    Color slotBgColor;
    bool showIcon;

    if (slotStatus == 'booked') {
      slotBgColor = Colors.orange;
      showIcon = false;
    } else if (slotStatus == 'vehicleParked') {
      slotBgColor = Colors.blue;
      showIcon = true;
    } else { // 'available'
      slotBgColor = Colors.green;
      showIcon = false;
    }

    return Container(
      decoration: BoxDecoration(
        color: slotBgColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue, width: 2),
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (showIcon) // control the img visibility
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.directions_car_filled, color: Colors.white,)
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Slot $slotNumber',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                  Text(
                    slotStatus == 'available'
                        ? 'Available'
                        : slotStatus == 'vehicleParked'
                        ? 'Parked'
                        : 'Booked',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
