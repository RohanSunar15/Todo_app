import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  VoidCallback onPressed;

  CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(buttonText),
    );
  }
}
