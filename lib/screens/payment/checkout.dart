import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:jctelecaller/provider/cart_provider.dart';
import 'package:jctelecaller/service/http_service.dart';
import 'package:jctelecaller/provider/user_provider.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  late IO.Socket socket;

  HttpService service = HttpService();
  bool _isLoading = false;

  String paymentMethod = 'Cash';
  List cartItems = [];
  double subTotal = 0.0;
  double shippingCost = 0.0;

  List<String> pinCodes = [];
  String? selectedPinCode;

  @override
  void initState() {
    super.initState();
    initializeSocket(); // Initialize the socket connection
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    setState(() {
      cartItems = args['cart'];
      subTotal = args['subTotal'];
      shippingCost = args['shippingCost'];
      paymentMethod = args['paymentMethod'] ?? 'Cash';
    });
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (userProvider.selectedUser != null) {
      nameController.text = userProvider.selectedUser!.name;
      emailController.text = userProvider.selectedUser!.email;
      contactController.text = userProvider.selectedUser!.phone;
    }
    fetchPinCodes();
  }

  void initializeSocket() {
    socket = IO.io(
      'http://10.0.2.2:5055', // Replace with your backend URL
      IO.OptionBuilder()
          .setTransports(['websocket']) // Use WebSocket transport
          .disableAutoConnect() // Prevents auto-connection
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print('Connected to socket server');
    });

    socket.onDisconnect((_) {
      print('Disconnected from socket server');
    });

    socket.on('order_response', (data) {
      print('Order Response: $data');
    });
  }

  Future<void> fetchPinCodes() async {
    try {
      final response =
          await service.getItems(endpointUrl: 'api/tele/get/pincodes');

      if (response != null && response.statusCode == 200) {
        final data = response.data;
        if (data['success'] == true && data['message'] is List) {
          List<String> fetchedPinCodes = List<String>.from(data['message']);
          setState(() {
            pinCodes = fetchedPinCodes;
            if (selectedPinCode == null ||
                !pinCodes.contains(selectedPinCode)) {
              selectedPinCode =
                  pinCodes.first; // Set only if no selection or invalid value
              zipCodeController.text = selectedPinCode!;
            }
          });
        } else {
          log('Unexpected API response format: $data');
        }
      } else {
        log('Failed to fetch pin codes: ${response?.statusCode}');
      }
    } catch (e) {
      log('Error fetching pin codes: $e');
    }
  }

  Future<void> submitOrder() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    String? telecallerId = userProvider.userId?.id;
    String? selectedUser = userProvider.selectedUser?.id;

    if (telecallerId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No logged-in user found! Please log in first."),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    double commission = 10.0;

    final orderData = {
      'order': {
        'user': selectedUser,
        'cart': cartItems,
        'subTotal': subTotal,
        'shippingCost': shippingCost,
        'paymentMethod': paymentMethod,
        'total': subTotal + shippingCost,
        'user_info': {
          'name': nameController.text,
          'email': emailController.text,
          'contact': contactController.text,
          'address': addressController.text,
          'city': cityController.text,
          'country': countryController.text,
          'zipCode': zipCodeController.text,
          'location': locationController.text,
        },
      },
      'commission': commission,
    };

    log("order data ---> $orderData");

    try {
      await service.addItem(
        endpointUrl: 'api/tele/telecaller/addorder/$telecallerId',
        itemData: orderData,
      );
      socket.emit("order-placed", orderData);
      print("Order sent via socket");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Order placed successfully!"),
          backgroundColor: Colors.green,
        ),
      );

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
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    double totalAmount = subTotal + shippingCost; // Calculate total amount

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display Total Amount
              Container(
                width: screenWidth < 600 ? screenWidth * 0.9 : 500,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: IKColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: IKColors.primary, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order Summary",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: IKColors.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Subtotal:",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600)),
                        Text(
                          "₹${subTotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Shipping Cost:",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600)),
                        Text(
                          "₹${shippingCost.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Divider(thickness: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Amount:",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹${totalAmount.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: IKColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Checkout Form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                        nameController, 'Full Name', true, screenWidth),
                    _buildTextField(emailController, 'Email', true, screenWidth,
                        keyboardType: TextInputType.emailAddress),
                    _buildTextField(
                        contactController, 'Contact Number', true, screenWidth,
                        keyboardType: TextInputType.phone),
                    _buildTextField(
                        addressController, 'Address', false, screenWidth),
                    _buildTextField(cityController, 'City', false, screenWidth),
                    _buildTextField(
                        countryController, 'Country', false, screenWidth),
                    _buildTextField(
                        locationController, 'Location', false, screenWidth),
                    _buildDropdownField('Zip Code', screenWidth),
                    const SizedBox(height: 20),
                    Center(
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: IKColors.primary)
                          : ElevatedButton(
                              onPressed: submitOrder,
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(screenWidth * 0.5, 50),
                                  backgroundColor: IKColors.primary),
                              child: const Text('Submit Order'),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    bool readOnly,
    double screenWidth, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: screenWidth < 600 ? screenWidth * 0.9 : 500,
        child: TextFormField(
          controller: controller,
          readOnly: readOnly,
          cursorColor: IKColors.primary,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            floatingLabelStyle: TextStyle(color: IKColors.primary),
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: IKColors.primary),
            ),
          ),
          validator: (value) =>
              value == null || value.isEmpty ? 'Please enter $label' : null,
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: screenWidth < 600 ? screenWidth * 0.9 : 500,
        child: DropdownButtonFormField<String>(
          value: selectedPinCode,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedPinCode = value;
                zipCodeController.text = value;
              });
              print("Selected Pin Code: $selectedPinCode"); // Debug print
            }
          },
          items: pinCodes.map((pin) {
            return DropdownMenuItem(
              value: pin,
              child: Text(pin),
            );
          }).toList(),
          decoration: InputDecoration(
            labelText: label,
            floatingLabelStyle: TextStyle(color: IKColors.primary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: IKColors.primary),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
