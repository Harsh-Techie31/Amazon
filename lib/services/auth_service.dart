import 'dart:convert';

import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/global_variable.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        name: name,
        email: email,
        password: password,
        id: '',
        type: '',
        token: '',
        address: '',
      );

      // Convert User object to JSON map
      Map<String, dynamic> userJson = user.toJson();
    print("will call api now");
      // Send HTTP POST request
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userJson),
      );
      print("API CALLED successfully");
      // Log the response status code and body
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Handle the response
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () {
          showSnackbar(context, "Account created successfully");
        },
      );
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }
}
