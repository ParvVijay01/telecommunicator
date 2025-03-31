import 'package:jctelecaller/models/telecaller.dart';

class User {
  String id;
  String name;
  final String? image;
  final String? address;
  final String? country;
  final String? city;
  final String email;
  final String phone;
  final String? password;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Telecaller? telecaller; // ✅ Add telecaller field

  User({
    required this.id,
    required this.name,
    this.image,
    this.address,
    this.country,
    this.city,
    required this.email,
    required this.phone,
    this.password,
    required this.createdAt,
    required this.updatedAt,
    this.telecaller, // ✅ Initialize it as nullable
  });

  // Convert JSON to User model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? 'No Name',
      image: json['image'] ?? '',
      address: json['address'] ?? '',
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      
      email: json['email'] ?? '',
      phone: json['phone'] ?? 'No Phone',
      password: json['password'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt']) ?? DateTime.now()
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt']) ?? DateTime.now()
          : DateTime.now(),
      telecaller: json['telecaller'] != null
          ? Telecaller.fromJson(json['telecaller'])
          : null, // ✅ Parse Telecaller object if it exists
    );
  }

  // Convert User model to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image,
      'address': address,
      'country': country,
      'city': city,
      'email': email,
      'phone': phone,
      'password': password,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'telecaller': telecaller?.toJson(), // ✅ Convert Telecaller to JSON
    };
  }
}
