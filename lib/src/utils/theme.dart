import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: GoogleFonts.quicksandTextTheme(ThemeData.light().textTheme)
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: GoogleFonts.quicksandTextTheme(ThemeData.dark().textTheme)
  );
}

