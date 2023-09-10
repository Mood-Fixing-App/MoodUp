import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String buttonText;
  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.color,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 150,
        minHeight: 50,
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        onPressed: () {},
        icon: Icon(
          // <-- Icon
          icon,
          size: 20.0,
          color: color,
        ),
        label: Text(
          buttonText,
          style: const TextStyle(
            color: kBlack,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ), // <-- Text
      ),
    );
  }
}