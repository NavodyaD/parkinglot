import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../models/parking_lot.dart';
import '../../services/parking_service.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  late GoogleMapController mapController;
  late Position currentLocation;
  List<ParkingLot> nearbyParkingLots = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    //_setupLocationStream();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    setState(() {
      currentLocation = position;
    });
  }

  /*void _setupLocationStream() {
    final parkingService = Provider.of<ParkingService>(context, listen: false);
    parkingService.getNearbyParkingLots(
        currentLocation.latitude,
        currentLocation.longitude
    ).listen((lots) {
      setState(() {
        nearbyParkingLots = lots;
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Parking'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () => Navigator.pushNamed(context, '/parking-history'),
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                  currentLocation?.latitude ?? 0,
                  currentLocation?.longitude ?? 0
              ),
              zoom: 15,
            ),
            markers: nearbyParkingLots.map((lot) => Marker(
              markerId: MarkerId(lot.id),
              position: LatLng(lot.latitude, lot.longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  lot.isOccupied ? BitmapDescriptor.hueRed : BitmapDescriptor.hueGreen
              ),
              //onTap: () => _showParkingLotDetails(lot),
            )).toSet(),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          ),
        ],
      ),
    );
  }

  /*void _showParkingLotDetails(ParkingLot lot) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ParkingLotDetailsSheet(
        parkingLot: lot,
        onBooking: () => _handleBooking(lot),
      ),
    );
  }

  Future<void> _handleBooking(ParkingLot lot) async {
    final duration = await showDialog<Duration>(
      context: context,
      builder: (context) => DurationPickerDialog(),
    );

    if (duration != null) {
      final parkingService = Provider.of<ParkingService>(context, listen: false);
      final success = await parkingService.bookParkingLot(
        lot.id,
        Provider.of<AuthProvider>(context, listen: false).currentUser!.id,
        DateTime.now().add(duration),
      );

      if (success) {
        // Process payment
        await parkingService.processPayment(
          lot.id,
          lot.pricePerHour * duration.inHours,
        );
      }
    }
  }*/
}