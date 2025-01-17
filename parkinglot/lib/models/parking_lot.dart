class ParkingLot {
  final String id;
  final String ownerId;
  final String name;
  final double latitude;
  final double longitude;
  final double pricePerHour;
  final bool isApproved;
  bool isOccupied;
  final String? occupiedBy;
  final DateTime? occupiedUntil;

  ParkingLot({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.pricePerHour,
    required this.isApproved,
    this.isOccupied = false,
    this.occupiedBy,
    this.occupiedUntil,
  });

  factory ParkingLot.fromJson(Map<String, dynamic> json) {
    return ParkingLot(
      id: json['id'],
      ownerId: json['ownerId'],
      name: json['name'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      pricePerHour: json['pricePerHour'],
      isApproved: json['isApproved'],
      isOccupied: json['isOccupied'],
      occupiedBy: json['occupiedBy'],
      occupiedUntil: json['occupiedUntil'] != null
          ? DateTime.parse(json['occupiedUntil'])
          : null,
    );
  }
}