import 'package:flutter/material.dart';
import 'package:moodup/src/utils/theme.dart';
import 'package:moodup/src/features/splash/screens/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MAppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
