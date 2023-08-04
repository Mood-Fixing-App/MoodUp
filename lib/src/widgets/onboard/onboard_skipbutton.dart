import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final void Function()? onPressed;

  final String text;

  const SkipButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}