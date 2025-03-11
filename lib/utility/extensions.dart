import 'package:flutter/material.dart';
import 'package:lookme/screens/auth/provider/user_provider.dart';
import 'package:provider/provider.dart';

extension Providers on BuildContext {
  UserProvider get userProvider => Provider.of<UserProvider>(this, listen: false);
}