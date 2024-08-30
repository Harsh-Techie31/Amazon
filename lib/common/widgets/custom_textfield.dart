import 'package:amazon/constants/global_variable.dart';
import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText ;
  const Customtextfield({super.key , required this.controller , required this.hintText});
  static const border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black26), // Unfocused border color
  );
  static const border2 = OutlineInputBorder(
    borderSide: BorderSide(color: GlobalVariables.secondaryColor), // Focused border color
  );
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      
      controller: controller,
      decoration:  InputDecoration(
        hintText: hintText,
        enabledBorder: border,
        focusedBorder: border2,
        
      ),
      validator: (value) {
        if(value == null || value.isEmpty){
          return "Enter your $hintText";
        }

        return null;
      },
    );
  }
}


