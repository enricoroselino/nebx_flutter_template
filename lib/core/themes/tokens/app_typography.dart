import 'package:flutter/material.dart';

class AppTypography {
  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    height: 1.25,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
    height: 1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.3,
  );

  static const TextStyle h5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.25,
  );

  static const TextStyle h6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.25,
  );

  // Body Text
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
    height: 1.5,
  );

  // Captions / Labels
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    height: 1.4,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.2,
  );
}
