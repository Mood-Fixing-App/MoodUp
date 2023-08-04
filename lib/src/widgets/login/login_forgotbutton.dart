import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';

class ForgotButton extends StatelessWidget {
  const ForgotButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          child: const Text(
            "FORGOT",
            style: TextStyle(
              color: kDarkGreen,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}