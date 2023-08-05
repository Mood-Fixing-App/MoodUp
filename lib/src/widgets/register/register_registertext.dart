import 'package:flutter/material.dart';
import 'package:moodup/src/constants/text_strings.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          tRegisterText,
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}