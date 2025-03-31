class Telecaller {
  final String id;
  final String name;
  final String email;
  final String mobile;
  final String city;
  final String state;
  final String pinCode;
  final String pan;
  final String aadhar;
  final String? bankAccNumber;
  final String? IFSC;
  final String? accountHolderName;
  final String designation;
  final String status;
  final double commission;
  final double remainingBalance;
  final List<String> orders;
  final DateTime createdAt;
  final DateTime updatedAt;

  Telecaller({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.city,
    required this.state,
    required this.pinCode,
    required this.pan,
    required this.aadhar,
    this.bankAccNumber,
    this.IFSC,
    this.accountHolderName,
    required this.designation,
    required this.status,
    required this.commission,
    required this.remainingBalance,
    required this.orders,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Telecaller.fromJson(Map<String, dynamic> json) {
    return Telecaller(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      city: json['city'],
      state: json['state'],
      pinCode: json['pinCode'],
      pan: json['pan'],
      aadhar: json['aadhar'],
      bankAccNumber: json['bankAccNumber'],
      IFSC: json['IFSC'],
      accountHolderName: json['accountHolderName'],
      designation: json['designation'],
      status: json['status'],
      commission: (json['commission'] ?? 0).toDouble(),
      remainingBalance: (json['remainingBalance'] ?? 0).toDouble(),
      orders: List<String>.from(json['orders'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'city': city,
      'state': state,
      'pinCode': pinCode,
      'pan': pan,
      'aadhar': aadhar,
      'bankAccNumber': bankAccNumber,
      'IFSC': IFSC,
      'accountHolderName': accountHolderName,
      'designation': designation,
      'status': status,
      'commission': commission,
      'remainingBalance': remainingBalance,
      'orders': orders,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
