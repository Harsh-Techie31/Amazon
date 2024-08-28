import 'package:amazon/common/widgets/custom_textfield.dart';
import 'package:amazon/constants/global_variable.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _selectedOption = 1;

  final _signupkey = GlobalKey<FormState>();
  final _signinkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // First RadioListTile
              RadioListTile<int>(
                tileColor: _selectedOption==1 ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundCOlor,
                activeColor: GlobalVariables.secondaryColor,
                title: Text('Create Account',
                    style: Theme.of(context).textTheme.headlineSmall),
                value: 1,
                groupValue: _selectedOption,
                onChanged: (int? value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),

              _selectedOption == 1
                  ? Form(
                      key: _signupkey,
                      child: Container(
                        color: GlobalVariables.backgroundColor,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Customtextfield(
                              controller: _nameController,
                              hintText: "Name",
                            ),
                            const SizedBox(height: 10,),
                            Customtextfield(
                              controller: _emailController,
                              hintText: "Email",
                            ),
                            const SizedBox(height: 10,),
                            Customtextfield(
                              controller: _passwordController,
                              hintText: "Password",
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),

              // Second RadioListTile
              RadioListTile<int>(
                activeColor: GlobalVariables.secondaryColor,
                title: Text('Sign-in',
                    style: Theme.of(context).textTheme.headlineSmall),
                value: 2,
                groupValue: _selectedOption,
                onChanged: (int? value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
