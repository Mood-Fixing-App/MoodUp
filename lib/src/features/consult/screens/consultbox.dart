import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';

class ConsultContainer extends StatelessWidget {
  final String title;

  const ConsultContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 15,
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kGreen,
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: kWhite,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
