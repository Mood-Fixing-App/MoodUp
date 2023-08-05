import 'package:flutter/material.dart';
import 'package:moodup/src/constants/text_strings.dart';

class ForgotText extends StatelessWidget {
  const ForgotText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          tForgotPasswordText,
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}