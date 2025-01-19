class ParkingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ParkingLot>> getNearbyParkingLots(double lat, double lng) {
    // Using GeoFlutterFire for location queries
    final geo = GeoFlutterFire();
    GeoFirePoint center = geo.point(latitude: lat, longitude: lng);

    var collectionReference = _firestore.collection('parking_lots');

    return geo.collection(collectionRef: collectionReference)
        .within(center: center, radius: 10, field: 'position')
        .map((List<DocumentSnapshot> docs) {
      return docs.map((doc) =>
          ParkingLot.fromJson(doc.data() as Map<String, dynamic>)
      ).toList();
    });
  }

  Future<bool> bookParkingLot(String parkingLotId, String userId, DateTime until) async {
    try {
      await _firestore.collection('parking_lots').doc(parkingLotId).update({
        'isOccupied': true,
        'occupiedBy': userId,
        'occupiedUntil': until.toIso8601String(),
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<void> processPayment(String parkingLotId, double amount) async {
    final paypal = PaypalService();
    await paypal.processPayment(amount);
    // After successful payment, trigger servo motor
    await triggerServoMotor(parkingLotId);
  }
}