import 'package:flutter/material.dart';

class AppMotion {
  AppMotion._();

  // Durations
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 600);

  // Easing
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeIn = Curves.easeIn;
}
