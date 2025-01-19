class User {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String userType; // 'user', 'owner', or 'admin'
  final String? profilePicture;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.userType,
    this.profilePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      userType: json['userType'],
      profilePicture: json['profilePicture'],
    );
  }
}
