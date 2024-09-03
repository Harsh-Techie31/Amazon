import 'dart:convert';

import 'package:amazon/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    name: '',
    email: '',
    type: '',
    password: '',
    id: '',
    token: '',
    address: '',
  );

  User get user => _user;

  void setUser(String userJson) {
    final Map<String, dynamic> userMap = jsonDecode(userJson);
    _user = User.fromMap(userMap);
    notifyListeners();
  }
}
