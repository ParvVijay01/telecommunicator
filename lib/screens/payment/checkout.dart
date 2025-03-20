import 'package:flutter/material.dart';
import 'package:lookme/models/customer.dart';
import 'package:provider/provider.dart';
import 'package:lookme/service/http_service.dart';
import 'package:lookme/provider/user_provider.dart'; // Import UserProvider

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  HttpService service = HttpService();

  String paymentMethod = 'Cash on Delivery'; // Default payment method
  List cartItems = []; // Cart Items
  double subTotal = 0.0;
  double shippingCost = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve arguments passed from the cart screen
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    setState(() {
      cartItems = args['cart']; // Fetch cart items
      subTotal = args['subTotal']; // Fetch subtotal
      shippingCost = args['shippingCost']; // Fetch shipping cost
      paymentMethod =
          args['paymentMethod'] ?? 'Cash on Delivery'; // Default fallback
    });
  }

  Future<void> submitOrder() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    User? user = Provider.of<UserProvider>(context, listen: false).loggedInUser;

    if (user == null) {
      print("DEBUG: No logged-in user found!"); // Debug statement
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No logged-in user found! Please log in first."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    print("DEBUG: Logged-in user found - ID: ${user.id}, Name: ${user.name}");

    final orderData = {
      'userId': user.id,
      'cart': cartItems,
      'subTotal': subTotal,
      'shippingCost': shippingCost,
      'paymentMethod': paymentMethod,
      'userInfo': {
        'name': nameController.text.isNotEmpty
            ? nameController.text
            : ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please enter your name"))),
        'email': emailController.text.isNotEmpty
            ? emailController.text
            : ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Please enter Email"))),
        'contact': contactController.text.isNotEmpty
            ? contactController.text
            : ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please enter phone number"))),
        'address': addressController.text,
        'city': cityController.text,
        'country': countryController.text,
        'zipCode': zipCodeController.text,
      },
    };

    print("DEBUG: Order Data - $orderData");

    try {
      final response = await service.addItem(
        endpointUrl: '/telecaller/addorder/${user.id}',
        itemData: orderData,
      );

      print("DEBUG: Response - $response");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Order placed successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print("DEBUG: Error - $e");
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
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: contactController,
              decoration: InputDecoration(labelText: 'Contact Number'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City'),
            ),
            TextField(
              controller: countryController,
              decoration: InputDecoration(labelText: 'Country'),
            ),
            TextField(
              controller: zipCodeController,
              decoration: InputDecoration(labelText: 'Zip Code'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitOrder, // Call the submit order function
              child: Text('Submit Order'),
            ),
          ],
        ),
      ),
    );
  }
}
