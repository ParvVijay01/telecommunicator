import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lookme/data/data_provider.dart';
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
  final DataProvider _dataProvider;
  final box = GetStorage();

  List<User> users = []; // Store all users
  List<User> searchResults = []; // Store search results
  User? selectedUser;

  UserProvider(this._dataProvider);

  /// Fetch all users from API
  Future<void> fetchAllUsers() async {
    try {
      final response = await service.getItems(endpointUrl: "api/customer");

      print("API Response Code: ${response.statusCode}");
      print("API Response Body: ${response.body}");

      if (response.isOk) {
        final List<dynamic> jsonList = response.body;

        users = jsonList
            .map((json) {
              try {
                return User.fromJson(json);
              } catch (e) {
                print("Error parsing user: $e");
                return null;
              }
            })
            .whereType<User>()
            .toList(); // Remove null entries

        print("Users loaded: ${users.length}");
      } else {
        print("Failed to load users: ${response.statusText}");
      }
    } catch (e) {
      print("Error fetching users: $e");
    }
    notifyListeners();
  }

  /// Search user by phone number
  Future<void> searchUserByPhone(String phoneNumber) async {
    if (phoneNumber.length != 10) {
      searchResults = [];
      SnackBarHelper.showErrorSnackBar("Please enter a valid phone number");
      notifyListeners();
      return;
    }

    if (users.isEmpty) {
      await fetchAllUsers(); // Ensure users are loaded before searching
    }

    String normalizedPhone =
        phoneNumber.startsWith("+91") ? phoneNumber.substring(3) : phoneNumber;

    searchResults = users.where((user) {
      String userPhone = user.phone ?? "";
      String shippingContact = user.shippingAddress?.contact ?? "";

      String normalizedUserPhone =
          userPhone.startsWith("+91") ? userPhone.substring(3) : userPhone;

      String normalizedShippingContact = shippingContact.startsWith("+91")
          ? shippingContact.substring(3)
          : shippingContact;

      return normalizedUserPhone == normalizedPhone ||
          normalizedShippingContact == normalizedPhone;
    }).toList();

    print("Found: ${searchResults.length} users");
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

      if (response.isOk) {
        final ApiResponse<User> apiResponse = ApiResponse<User>.fromJson(
            response.body,
            (json) => User.fromJson(json as Map<String, dynamic>));

        if (apiResponse.success == true) {
          User? user = apiResponse.data;
          saveLoginInfo(user);
          SnackBarHelper.showSuccessSnackBar(apiResponse.message ?? "Success");
          log("Login Successful");
          return null;
        } else {
          SnackBarHelper.showErrorSnackBar(
              "Failed to login: ${apiResponse.message}");
          return "Failed to login: ${apiResponse.message}";
        }
      } else {
        SnackBarHelper.showErrorSnackBar(
            "Error ${response.body?['message'] ?? response.statusText}");
        return "Error ${response.body?['message'] ?? response.statusText}";
      }
    } catch (err) {
      print(err);
      SnackBarHelper.showErrorSnackBar('An error occurred: $err');
      return "An error occurred $err";
    }
  }

  Future<void> saveLoginInfo(User? loginUser) async {
    if (loginUser == null) {
      print("saveLoginInfo: No user data to save.");
      return;
    }

    await box.write(USER_INFO_BOX, loginUser.toJson());
    print("User data saved successfully: ${box.read(USER_INFO_BOX)}");

    notifyListeners(); // Ensure UI updates
  }

  User? getLoginUser() {
    Map<String, dynamic>? userJson = box.read(USER_INFO_BOX);
    print("Retrieved user data from storage: $userJson"); // Debugging log

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
