import 'package:amazon/constants/global_variable.dart';
import 'package:amazon/features/auth/screens/auth_screen.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>UserProvider(),),
  ],child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.greyBackgroundCOlor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          //backgroundColor: GlobalVariables.secondaryColor,
        ),
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        useMaterial3: false,
      ),

      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
