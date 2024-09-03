import 'dart:convert';

class User {
  final String name;
  final String email;
  final String password;
  final String id;
  final String type;
  final String token;
  final String address;

  User({
    required this.name,
    required this.email,
    required this.type,
    required this.password,
    required this.id,
    required this.token,
    required this.address,
  });

  // Convert a User object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'type': type,
      'password': password,
      'id': id,
      'token': token,
      'address': address,
    };
  }

  //Create a User object from a JSON map
  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      type: json['type'] ?? '',
      password: json['password'] ?? '',
      id: json['_id'] ?? '',
      token: json['token'] ?? '',
      address: json['address'] ?? '',
    );
  }

  factory User.fromJson(String source) => User.fromMap(jsonDecode(source));


}
