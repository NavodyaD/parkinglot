import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parkinglot/firebase_options.dart';
import 'package:parkinglot/screens/owner/dashboard.dart';
import 'package:parkinglot/screens/user/dashboard.dart';
import 'package:parkinglot/screens/user/parking_details_page.dart';
import 'package:provider/provider.dart';

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
      home: ParkingDetailsPage(),
    );
    /*return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ParkingLotProvider()),
      ],
      child: MaterialApp(
        title: 'Smart Parking',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthWrapper(),
        routes: {
          '/user-dashboard': (context) => UserDashboard(),
          '/owner-dashboard': (context) => OwnerDashboard(),
          //'/profile': (context) => UserProfile(),
          '/parking-history': (context) => ParkingHistory(),
        },
      ),
    );*/
  }
}
