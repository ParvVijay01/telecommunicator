import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jctelecaller/models/customer.dart';
import 'package:jctelecaller/screens/auth/sign_in.dart';
import 'package:jctelecaller/service/http_service.dart';
import 'package:jctelecaller/utility/constants.dart';
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
  User? _userId;

  UserProvider() {
    loadLoggedInUser(); // Load user on app start
    getUserId();
  }

  /// Getters
  List<User> get users => _users;
  List<User> get searchResults => _searchResults;
  User? get selectedUser => _selectedUser;
  User? get loggedInUser => _loggedInUser;
  bool get isAuthenticated => _loggedInUser != null;
  User? get userId => _userId;

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

        if (response?.data is Map && response?.data.containsKey('data')) {
          _searchResults = [User.fromJson(response?.data['data'])];
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

  /// Login user & store in local storage

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

          // Create a User object from response
          User user = User.fromJson(responseData);

          _loggedInUser = user;
          _userId = user;
          log("✅ Login successful, user data saved: ${user.toJson()}");

          // Save user in both SharedPreferences & GetStorage
          await saveUser(user, token);
          _box.write(USER_INFO_BOX, jsonEncode(user.toJson()));
          _box.write("auth_token", token);

          // Store telecaller details if available
          if (user.telecaller != null) {
            _box.write("commission", user.telecaller!.commission);
            _box.write("remainingBalance", user.telecaller!.remainingBalance);
            _box.write(
                "totalIncome",
                user.telecaller!.commission +
                    user.telecaller!.remainingBalance);
            _box.write("orders", user.telecaller!.orders.length);
          }

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

  Future<void> saveUser(User user, String token) async {
    log("Before saving: ${user.toJson()}"); // Ensure correct data before saving
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(user.toJson()));
    await prefs.setString('token', token);
    log("✅ User saved: ${user.toJson()}");
  }

  Future<User?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');

    if (userJson != null && userJson.isNotEmpty) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      User user = User.fromJson(userMap);

      _userId = user;
      log("✅ Retrieved User ID: ${_userId?.id}");

      return user;
    } else {
      log("⚠️ No user found in SharedPreferences");
      return null;
    }
  }

  /// Load user from local storage
  Future<void> loadLoggedInUser() async {
    _loggedInUser = await getUserId();
    if (_loggedInUser != null) {
      _userId = _loggedInUser; // Ensure user ID is set
      log("🔄 User session restored: ${_loggedInUser?.toJson()}");
    } else {
      log("⚠️ No logged-in user found in storage.");
    }
    notifyListeners();
  }

  /// Logout user & clear storage
  Future<void> logOutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clears all stored user data

    await _box.remove(USER_INFO_BOX);
    await _box.remove("auth_token");

    _loggedInUser = null;
    notifyListeners();

    log("🚪 User logged out successfully");
    Get.offAll(const SignIn());
  }
}
