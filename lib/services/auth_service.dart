import 'dart:convert';
import 'package:amazon/constants/error_handling.dart';
import 'package:amazon/constants/global_variable.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/features/home/screens/home_screen.dart';
import 'package:amazon/models/user.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      //print("will call api now");

      // Send HTTP POST request
      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userJson),
      );

      // Handle the response
      if (context.mounted) {
        httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () {
            showSnackbar(context, "Account created successfully");
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        showSnackbar(context, e.toString());
      }
    }
  }

  void signinUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      //print(response.body);

      if (context.mounted) {
        httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            context.mounted ? Provider.of<UserProvider>(context , listen: false).setUser(response.body) : null;
            await prefs.setString('x-auth-token', jsonDecode(response.body)['token']);
            context.mounted ?Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route)=>false,) : null;
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        showSnackbar(context, e.toString());
      }
    }
  }
}
