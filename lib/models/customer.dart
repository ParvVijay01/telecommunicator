class User {
  final String id;
  final String name;
  final String? image;
  final String? address;
  final String? country;
  final String? city;
  final ShippingAddress? shippingAddress;
  final String email;
  final String phone;
  final String? password;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    this.image,
    this.address,
    this.country,
    this.city,
    this.shippingAddress,
    required this.email,
    required this.phone,
    this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  // Convert JSON to User model
  factory User.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {}; // Extract `data` object if present
    return User(
      id: data['_id'] ?? '',
      name: data['name'] ?? 'No Name',
      image: data['image'] ?? '',
      address: data['address'] ?? '',
      country: data['country'] ?? '',
      city: data['city'] ?? '',
      shippingAddress: data['shippingAddress'] != null
          ? ShippingAddress.fromJson(data['shippingAddress'])
          : null,
      email: data['email'] ?? '',
      phone: data['phone'] ?? 'No Phone',
      password: data['password'] ?? '',
      createdAt: data['createdAt'] != null
          ? DateTime.tryParse(data['createdAt']) ?? DateTime.now()
          : DateTime.now(),
      updatedAt: data['updatedAt'] != null
          ? DateTime.tryParse(data['updatedAt']) ?? DateTime.now()
          : DateTime.now(),
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
      'shippingAddress': shippingAddress?.toJson(),
      'email': email,
      'phone': phone,
      'password': password,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

// Shipping Address Model
class ShippingAddress {
  final String name;
  final String contact;
  final String email;
  final String address;
  final String country;
  final String city;
  final String area;
  final String zipCode;
  final bool isDefault;

  ShippingAddress({
    required this.name,
    required this.contact,
    required this.email,
    required this.address,
    required this.country,
    required this.city,
    required this.area,
    required this.zipCode,
    required this.isDefault,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      name: json['name'] ?? '',
      contact: json['contact'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      area: json['area'] ?? '', // Handle missing 'area'
      zipCode: json['zipCode'] ?? '',
      isDefault: json['isDefault'] ?? false, // Default to 'false' if missing
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'contact': contact,
      'email': email,
      'address': address,
      'country': country,
      'city': city,
      'area': area,
      'zipCode': zipCode,
      'isDefault': isDefault,
    };
  }
}
