import 'package:flutter/material.dart';
import 'package:lookme/provider/telecaller_provider.dart';
import 'package:lookme/provider/user_provider.dart';
import 'package:provider/provider.dart';

extension Providers on BuildContext {
  UserProvider get userProvider =>
      Provider.of<UserProvider>(this, listen: false);
  TelecallerProvider get telecallerProvider =>
      Provider.of<TelecallerProvider>(this, listen: false);
}
