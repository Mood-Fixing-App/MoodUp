import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';

class ExerciseTile extends StatelessWidget {
  final String exerciseName;

  const ExerciseTile({super.key, required this.exerciseName});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> exerciseImages = {
      'Exercise 1': 'assets/images/slide1.png',
      'Exercise 2': 'assets/images/slide2.png',
      'Exercise 3': 'assets/images/slide3.png',
      'Exercise 4': 'assets/images/slide4.png',
      'Exercise 5': 'assets/images/slide1.png',
      'Exercise 6': 'assets/images/slide2.png',
    };

    final String? exerciseImagePath = exerciseImages[exerciseName];

    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (exerciseImagePath != null)
              Image.asset(
                exerciseImagePath,
                width: 125.0,
                height: 110.0,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 8.0),
            Text(
              exerciseName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
