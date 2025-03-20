import 'package:flutter/material.dart';
import 'package:lookme/provider/cart_provider.dart';
import 'package:lookme/provider/user_provider.dart';
import 'package:provider/provider.dart';

extension Providers on BuildContext {
  UserProvider get userProvider =>
      Provider.of<UserProvider>(this, listen: false);
  CartProvider get cartProvider =>
      Provider.of<CartProvider>(this, listen: false);
}
