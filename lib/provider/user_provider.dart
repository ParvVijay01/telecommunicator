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

class UserProvider extends ChangeNotifier {
  HttpService service = HttpService();
  final box = GetStorage();

  List<User> users = []; // Store all users
  List<User> searchResults = []; // Store search results
  User? selectedUser;

  /// Fetch all users from API
  Future<void> fetchAllUsers() async {
    try {
      final response = await service.getItems(endpointUrl: "api/customer");

      print("API Response Code: \${response.statusCode}");
      print("API Response Body: \${response.data}");

      if (response?.statusCode == 200) {
        final List<dynamic> jsonList = response?.data;

        users = jsonList
            .map((json) {
              try {
                return User.fromJson(json);
              } catch (e) {
                print("Error parsing user: \$e");
                return null;
              }
            })
            .whereType<User>()
            .toList(); // Remove null entries

        print("Users loaded: \${users.length}");
      } else {
        print("Failed to load users: \${response.statusMessage}");
      }
    } catch (e) {
      print("Error fetching users: \$e");
    }
    notifyListeners();
  }

  /// Search user by phone number
  Future<void> searchUserByPhone(String phoneNumber) async {
    try {
      var response = await service.getItems(
          endpointUrl: 'api/tele/get-customer/$phoneNumber');

      if (response?.statusCode == 200 && response?.data != null) {
        log("searched user ---> ${response?.data}");
        if (response?.data is List) {
          // If API returns multiple users
          searchResults = (response?.data as List)
              .map(
                  (userJson) => User.fromJson(userJson as Map<String, dynamic>))
              .toList();
        } else if (response?.data is Map) {
          // If API returns a single user object
          searchResults = [
            User.fromJson(response?.data as Map<String, dynamic>)
          ];
        } else {
          searchResults = [];
        }
      } else {
        searchResults = [];
      }
    } on DioException catch (e) {
      // ✅ Explicitly handle 404 errors
      if (e.response?.statusCode == 404) {
        debugPrint("User not found: ${e.response?.data}");
        searchResults = []; // Set empty list to show "USER NOT FOUND"
      } else {
        debugPrint("API error: $e");
      }
    } catch (e) {
      debugPrint("Unexpected error: $e");
    }

    notifyListeners();
  }

  void clearSearchResults() {
    searchResults = [];
    notifyListeners();
  }

  void setSelectedUser(User user) {
    selectedUser = user;
    notifyListeners();
  }

  Future<String?> login(LoginData data) async {
    try {
      Map<String, dynamic> loginData = {
        "email": data.name.toLowerCase(), // Change "name" to "email"
        "password": data.password
      };

      final response = await service.addItem(
          endpointUrl: "api/customer/login-tele", itemData: loginData);

      if (response?.statusCode == 200) {
        final ApiResponse<User> apiResponse = ApiResponse<User>.fromJson(
            response?.data,
            (json) => User.fromJson(json as Map<String, dynamic>));

        if (apiResponse.success == true) {
          User? user = apiResponse.data;
          saveLoginInfo(user);
          SnackBarHelper.showSuccessSnackBar(apiResponse.message ?? "Success");
          log("Login Successful");
          return null;
        } else {
          SnackBarHelper.showErrorSnackBar(
              "Failed to login: \${apiResponse.message}");
          return "Failed to login: \${apiResponse.message}";
        }
      } else {
        SnackBarHelper.showErrorSnackBar(
            "Error \${response.data?['message'] ?? response.statusMessage}");
        return "Error \${response.data?['message'] ?? response.statusMessage}";
      }
    } catch (err) {
      print(err);
      SnackBarHelper.showErrorSnackBar('An error occurred: \$err');
      return "An error occurred \$err";
    }
  }

  Future<void> saveLoginInfo(User? loginUser) async {
    if (loginUser == null) {
      print("saveLoginInfo: No user data to save.");
      return;
    }

    await box.write(USER_INFO_BOX, loginUser.toJson());
    print("User data saved successfully: \${box.read(USER_INFO_BOX)}");

    notifyListeners(); // Ensure UI updates
  }

  User? getLoginUser() {
    Map<String, dynamic>? userJson = box.read(USER_INFO_BOX);
    print("Retrieved user data from storage: \$userJson"); // Debugging log

    if (userJson == null || userJson.isEmpty) {
      return null; // Return null if storage is empty
    }

    return User.fromJson(userJson);
  }

  logOutUser() {
    box.remove(USER_INFO_BOX);
    Get.offAll(const SignIn());
  }
}
