import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;

  const CustomeButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(text),
    );
  }
}
