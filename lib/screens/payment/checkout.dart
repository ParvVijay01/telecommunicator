import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lookme/provider/cart_provider.dart';
import 'package:lookme/service/http_service.dart';
import 'package:lookme/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  HttpService service = HttpService();
  UserProvider dataprovider = UserProvider();

  String paymentMethod = 'Cash on Delivery';
  List cartItems = [];
  double subTotal = 0.0;
  double shippingCost = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    setState(() {
      cartItems = args['cart'];
      subTotal = args['subTotal'];
      shippingCost = args['shippingCost'];
      paymentMethod = args['paymentMethod'] ?? 'Cash on Delivery';
    });
  }

  Future<void> submitOrder() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String? userId = userProvider.userId?.id;
    String? selectedUser = userProvider.selectedUser?.id;

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No logged-in user found! Please log in first."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    log("DEBUG: Logged-in user ID: $userId");
    log("DEBUG: Selected user ID: $selectedUser");

    double commission = 10.0;

    final orderData = {
      'order': {
        'user': selectedUser,
        'cart': cartItems,
        'subTotal': subTotal,
        'shippingCost': shippingCost,
        'paymentMethod': paymentMethod,
        'total': subTotal + shippingCost,
        'userInfo': {
          'name': nameController.text,
          'email': emailController.text,
          'contact': contactController.text,
          'address': addressController.text,
          'city': cityController.text,
          'country': countryController.text,
          'zipCode': zipCodeController.text,
        },
      },
      'commission': commission,
    };

    try {
      final response = await service.addItem(
        endpointUrl: 'api/tele/telecaller/addorder/$userId',
        itemData: orderData,
      );

      log("DEBUG: Response - $response");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Order placed successfully!"),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate to Search User Screen after successful order submission
      Provider.of<CartProvider>(context, listen: false).clearCart();
      Navigator.pushReplacementNamed(context, '/search_user');
    } catch (e) {
      debugPrint("DEBUG: Error - $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to place order!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildResponsiveTextField(
                  controller: nameController,
                  label: 'Full Name',
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your name'
                      : null,
                  screenWidth: screenWidth,
                ),
                _buildResponsiveTextField(
                  controller: emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your email'
                      : null,
                  screenWidth: screenWidth,
                ),
                _buildResponsiveTextField(
                  controller: contactController,
                  label: 'Contact Number',
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter your phone number'
                      : null,
                  screenWidth: screenWidth,
                ),
                _buildResponsiveTextField(
                  controller: addressController,
                  label: 'Address',
                  screenWidth: screenWidth,
                ),
                _buildResponsiveTextField(
                  controller: cityController,
                  label: 'City',
                  screenWidth: screenWidth,
                ),
                _buildResponsiveTextField(
                  controller: countryController,
                  label: 'Country',
                  screenWidth: screenWidth,
                ),
                _buildResponsiveTextField(
                  controller: zipCodeController,
                  label: 'Zip Code',
                  keyboardType: TextInputType.number,
                  screenWidth: screenWidth,
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: submitOrder,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(screenWidth * 0.5, 50),
                    ),
                    child: const Text('Submit Order'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    required double screenWidth,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: screenWidth < 600 ? screenWidth * 0.9 : 500,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}
