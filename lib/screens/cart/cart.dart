import 'package:flutter/material.dart';
import 'package:jctelecaller/provider/cart_provider.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping Cart")),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final cartItems = cartProvider.items;

          return cartItems.isEmpty
              ? const Center(child: Text("Your cart is empty"))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];

                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: ListTile(
                              leading: Image.network(
                                item['image'],
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset('assets/images/logo.png',
                                        width: 50, height: 50),
                              ),
                              title: Text(item['title'], style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Price: ₹${item['originalPrice']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .decreaseQuantity(item['id']);
                                        },
                                      ),
                                      Text(
                                        "${item['quantity']}",
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .increaseQuantity(item['id']);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeItem(item['id']);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Summary Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          summaryRow("Subtotal",
                              "₹${cartProvider.subtotal.toStringAsFixed(2)}"),
                          summaryRow("Shipping Cost",
                              "₹${cartProvider.shippingCost.toStringAsFixed(2)}"),
                          const Divider(thickness: 1),
                          summaryRow("Total",
                              "₹${cartProvider.total.toStringAsFixed(2)}",
                              isBold: true),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: IKColors.primary),
                            onPressed: () {
                              // Navigate to the checkout page with default payment method set to COD
                              Navigator.pushNamed(
                                context,
                                "/checkout",
                                arguments: {
                                  'paymentMethod': 'cash', // Set COD as default
                                  'cart':
                                      cartProvider.items, // Pass the cart items
                                  'subTotal': cartProvider.subtotal,
                                  'shippingCost': cartProvider.shippingCost,
                                  'total': cartProvider.total,
                                },
                              );
                            },
                            child: const Text("Proceed to Checkout"),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

// Helper Widget for Summary Row
  Widget summaryRow(String title, String value,
      {Color? color, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight:  FontWeight.bold ,
              color: Colors.black,)),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight:  FontWeight.bold ,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
