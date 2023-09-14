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
        color: kLightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          emo,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
