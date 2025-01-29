import 'package:firebase_database/firebase_database.dart';

class SlotService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('slots');

  // Function to get the states of slots
  Stream<String> getSlotStatus(int slotNumber) {
    return _dbRef.child(slotNumber.toString()).onValue.map((event) {
      if (event.snapshot.value != null) {
        return event.snapshot.value as String;
      }
      return "available"; // set default as 'available'
    });
  }

  // function to update the slot status when creating a booking
  Future<void> updateSlotStatus(int slotNumber, String status) async {
    await _dbRef.child(slotNumber.toString()).set(status);
  }
}
