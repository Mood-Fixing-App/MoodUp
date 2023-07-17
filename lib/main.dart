import 'package:flutter/material.dart';
import 'package:moodup/src/utils/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MAppTheme.darkTheme,
      home: const Scaffold(
        body: Center(
          child: Text('Helo od!'),
        ),
      ),
    );
  }
}
