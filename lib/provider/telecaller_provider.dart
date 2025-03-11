import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/telecaller.dart';

class TelecallerProvider with ChangeNotifier {
  Telecaller? _telecaller;

  Telecaller? get telecaller => _telecaller;

  Future<void> fetchTelecallerById(String telecallerId) async {
    final url = Uri.parse('https://your-backend-url.com/telecaller/$telecallerId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _telecaller = Telecaller.fromJson(data);
        notifyListeners();
      } else {
        throw Exception('Failed to load telecaller');
      }
    } catch (error) {
      throw Exception('Error fetching telecaller: $error');
    }
  }
}
