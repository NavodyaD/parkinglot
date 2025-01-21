import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/parking_lot.dart';
import '../../services/parking_service.dart';

/*class OwnerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Parking Lots'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddParkingLotDialog(context),
          ),
        ],
      ),
      body: StreamBuilder<List<ParkingLot>>(
        stream: Provider.of<ParkingService>(context).getOwnerParkingLots(
            Provider.of<AuthProvider>(context).currentUser!.id
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final lot = snapshot.data![index];
              return ParkingLotCard(
                parkingLot: lot,
                onDelete: () => _deleteParkingLot(context, lot.id),
              );
            },
          );
        },
      ),
    );
  }
}*/