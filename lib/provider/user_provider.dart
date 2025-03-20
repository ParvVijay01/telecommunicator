import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lookme/models/api_response.dart';
import 'package:lookme/models/customer.dart';
import 'package:lookme/screens/auth/sign_in.dart';
import 'package:lookme/service/http_service.dart';
import 'package:lookme/utility/constants.dart';
import 'package:lookme/utility/snackbar_helper.dart';
import 'package:get/get.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  final HttpService _service = HttpService();
  final GetStorage _box = GetStorage();

  List<User> _users = []; // Store all users
  List<User> _searchResults = []; // Store search results
  User? _selectedUser;
  User? _loggedInUser;

  UserProvider() {
    _loadUserFromStorage(); // Load user data on init
  }

  /// Getters
  List<User> get users => _users;
  List<User> get searchResults => _searchResults;
  User? get selectedUser => _selectedUser;
  User? get loggedInUser => _loggedInUser;
  bool get isAuthenticated => _loggedInUser != null;

  /// Fetch all users from API
  Future<void> fetchAllUsers() async {
    try {
      final response = await _service.getItems(endpointUrl: "api/customer");

      if (response?.statusCode == 200 && response?.data is List) {
        _users = (response?.data as List)
            .map((json) => User.fromJson(json))
            .toList();

        log("✅ Users loaded: ${_users.length}");
      } else {
        log("⚠️ Failed to load users: ${response?.statusMessage}");
      }
    } catch (e) {
      log("❌ Error fetching users: $e");
    }
    notifyListeners();
  }

  /// Search user by phone number
  Future<void> searchUserByPhone(String phoneNumber) async {
    try {
      final response = await _service.getItems(
          endpointUrl: 'api/tele/get-customer/$phoneNumber');

      if (response?.statusCode == 200 && response?.data != null) {
        log("🔍 Search response: ${response?.data}");

        if (response?.data is List) {
          _searchResults = (response?.data as List)
              .map((json) => User.fromJson(json))
              .toList();
        } else if (response?.data is Map) {
          _searchResults = [User.fromJson(response?.data)];
        } else {
          _searchResults = [];
        }
      } else {
        _searchResults = [];
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        log("⚠️ User not found: ${e.response?.data}");
      } else {
        log("❌ API error: $e");
      }
      _searchResults = [];
    } catch (e) {
      log("❌ Unexpected error: $e");
      _searchResults = [];
    }

    notifyListeners();
  }

  /// Clear search results
  void clearSearchResults() {
    _searchResults = [];
    notifyListeners();
  }

  /// Set selected user
  void setSelectedUser(User user) {
    _selectedUser = user;
    notifyListeners();
  }

  /// Login user
  Future<String?> login(LoginData data) async {
    try {
      Map<String, dynamic> loginData = {
        "email": data.name.toLowerCase(),
        "password": data.password,
      };

      final response = await _service.addItem(
        endpointUrl: "api/customer/login-tele",
        itemData: loginData,
      );

      if (response?.statusCode == 200) {
        final responseData = response?.data;
        log("🔑 Login Response: $responseData");

        if (responseData != null && responseData['success'] == true) {
          final String token = responseData['token'] ?? "";

          // Ensure all fields are properly mapped
          User user = User.fromJson({
            "_id": responseData['_id'] ?? "",
            "name": responseData['name'] ?? "No Name",
            "email": responseData['email'] ?? "",
            "phone": responseData['phone'] ?? "No Phone",
            "image": responseData['image'] ?? "",
            "address": responseData['address'] ?? "",
            "country": responseData['country'] ?? "",
            "city": responseData['city'] ?? "",
            "shippingAddress": responseData['shippingAddress'] ?? null,
            "createdAt": responseData['createdAt'] ?? "",
            "updatedAt": responseData['updatedAt'] ?? "",
          });

          await _saveLoginInfo(user, token);
          log("✅ Login successful, user data saved: ${user.toJson()}");

          SnackBarHelper.showSuccessSnackBar("Login successful!");
          return null;
        } else {
          return "Login failed: ${responseData?['message'] ?? 'Unknown error'}";
        }
      } else {
        return "Error: ${response?.statusMessage}";
      }
    } catch (err) {
      log("❌ Login error: $err");
      return "An error occurred: $err";
    }
  }

  /// Load user from storage
  void _loadUserFromStorage() {
    Map<String, dynamic>? userJson = _box.read(USER_INFO_BOX);
    log("📦 Loaded user from storage: $userJson");

    if (userJson != null && userJson["_id"] != null) {
      _loggedInUser = User.fromJson(userJson);
      log("✅ User restored: ${_loggedInUser?.toJson()}");
    } else {
      log("⚠️ No valid user found in storage");
    }
  }

  /// Save login info
  Future<void> _saveLoginInfo(User user, String token) async {
  final prefs = await SharedPreferences.getInstance();

  log("📦 Saving user data: ${user.toJson()}");
  log("🔑 Saving token: $token");

  await prefs.setString('auth_token', token);
  await prefs.setString('user_data', jsonEncode(user.toJson()));

  log("✅ User data successfully saved.");
}
  /// Logout user
  Future<void> logOutUser() async {
    await _box.remove(USER_INFO_BOX);
    await _box.remove("auth_token");

    _loggedInUser = null;
    notifyListeners();

    log("🚪 User logged out successfully");
    Get.offAll(const SignIn());
  }
}
