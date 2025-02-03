import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:parkinglot/screens/user/parking_details_page.dart';
import 'package:parkinglot/screens/user/parking_loc_2/parking_details_loc_2.dart';

class ParkingMapPage extends StatefulWidget {
  @override
  _ParkingMapPageState createState() => _ParkingMapPageState();
}

class _ParkingMapPageState extends State<ParkingMapPage> {
  final List<Marker> _markers = [];

  final LatLng _parkingLocation_1 = LatLng(6.037, 80.220); //  coordinates
  final LatLng _parkingLocation_2 = LatLng(7.290444, 80.632897);

  @override
  void initState() {
    super.initState();
    _addStaticMarkers();
  }

  void _navigateToParkingLocationOne() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ParkingDetailsPage(),
      ),
    );
  }

  void _navigateToParkingLocationTwo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ParkingDetailsLocation2(),
      ),
    );
  }

  // add markers
  void _addStaticMarkers() {
    _markers.addAll([
      Marker(
        point: _parkingLocation_1,
        width: 80,
        height: 80,
        // gesture detector as marker child
        child: GestureDetector(
          onTap: () {
            _navigateToParkingLocationOne();
          },
          child: Icon(Icons.directions_car, color: Colors.blue, size: 30,),
        ),
      ),
      Marker(
        point: _parkingLocation_2,
        width: 80,
        height: 80,
        // gesture detector as marker child
        child: GestureDetector(
          onTap: () {
            _navigateToParkingLocationTwo();
          },
          child: Icon(Icons.directions_car, color: Colors.blue, size: 30,),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parkings'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(6.9271, 79.8612), // initial center location
          initialZoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate:
            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', // Free OpenStreetMap tiles
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: _markers,
          ),
        ],
      ),
    );
  }
}
