import 'package:amazon/common/widgets/custom_button.dart';
import 'package:amazon/common/widgets/custom_textfield.dart';
import 'package:amazon/constants/global_variable.dart';
import 'package:amazon/services/auth_service.dart';
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

  final AuthService authService = AuthService();

  void signupUser() {
    //print("SIGN UP USER CALLED");
    authService.signUpUser(
        context: context,
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
  }

  void signinUser() {
    //print("SIGN UP USER CALLED");
    authService.signinUser(
        context: context,
        //name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text);
  }

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
                tileColor: _selectedOption == 1
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Customtextfield(
                              controller: _emailController,
                              hintText: "Email",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Customtextfield(
                              controller: _passwordController,
                              hintText: "Password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomeButton(text: "Sign-up", ontap: () {
                                //print("Sign-up button pressed");
                                if (_signupkey.currentState!.validate()) {
                                  //print("Form validated");
                                  signupUser();
                                } else {
                                 // print("Form validation failed");
                                }
                              },)
                           
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),

              // Second RadioListTile
              RadioListTile<int>(
                tileColor: _selectedOption == 2
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
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

              _selectedOption == 2
                  ? Form(
                      key: _signinkey,
                      child: Container(
                        color: GlobalVariables.backgroundColor,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Customtextfield(
                              controller: _emailController,
                              hintText: "Email",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Customtextfield(
                              controller: _passwordController,
                              hintText: "Password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomeButton(text: "Sign-in", ontap: () {
                                if (_signinkey.currentState!.validate()) {
                                  //print("Form validated");
                                  signinUser();
                                } else {
                                 // print("Form validation failed");
                                }
                              
                            })
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
