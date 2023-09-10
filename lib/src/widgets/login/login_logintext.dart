import 'package:flutter/material.dart';
import 'package:moodup/src/constants/text_strings.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          tLoginText,
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}