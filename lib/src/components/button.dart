import 'package:flutter/material.dart';

import 'package:moodup/src/constants/colors.dart';

class MyButton extends StatelessWidget {
  final IconData iconData;

  const MyButton({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kLightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          iconData,
          color: kWhite,
        ),
      ),
    );
  }
}
