import 'package:flutter/material.dart';
import 'package:moodup/src/constants/image_strings.dart';

class ForgotImage extends StatelessWidget {
  const ForgotImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      kForgotImage,
      height: 231,
      width: 231,
    );
  }
}