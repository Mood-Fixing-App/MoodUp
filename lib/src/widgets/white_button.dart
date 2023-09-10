import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';

class WhiteButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double width;
  final double height;

  const WhiteButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: kDarkGreen,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
