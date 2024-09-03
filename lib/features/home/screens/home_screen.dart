import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return  Scaffold(
      body: Center(
        child: Text(user.toJson().toString(),style: const TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
