import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parkinglot/firebase_options.dart';
import 'package:parkinglot/screens/admin/admin_dashboard.dart';
import 'package:parkinglot/screens/user/dashboard.dart';
import 'package:parkinglot/screens/user/maps_page_parkings.dart';
import 'package:parkinglot/screens/user/parking_details_page.dart';
import 'package:provider/provider.dart';
import 'package:parkinglot/screens/login_page.dart';
import 'package:parkinglot/screens/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: AdminDashboard(),
      home: ParkingMapPage(),
    );
  }
}
