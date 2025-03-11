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

  UserProvider(this._dataProvider);

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
    await box.write(USER_INFO_BOX, loginUser?.toJson());
    Map<String, dynamic>? userJson = box.read(USER_INFO_BOX);
  }

  User? getLoginUsr() {
    Map<String, dynamic>? userJson = box.read(USER_INFO_BOX);
    User? userLogged = User.fromJson(userJson ?? {});
    return userLogged;
  }

  logOutUser() {
    box.remove(USER_INFO_BOX);
    Get.offAll(const SignIn());
  }
}
