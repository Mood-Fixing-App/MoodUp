import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';

class Emo extends StatelessWidget {
  final String emo;

  const Emo({
    Key? key,
    required this.emo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kLightBlack, // Choose the border color you want
          width: 1.0, // Set the border width (1.0 is a thin border)
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          emo,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
