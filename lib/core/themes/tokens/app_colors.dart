import 'package:flutter/material.dart';

/// Semantic color tokens for the design system.
/// Never use raw hex in components — always use these.
class AppColors {
  AppColors._();

  // Light Mode Colors
  static const _lightPrimary = Color(0xFF0066CC);
  static const _lightOnPrimary = Color(0xFFFFFFFF);
  static const _lightSurface = Color(0xFFFFFFFF);
  static const _lightOnSurface = Color(0xFF1A1A1A);
  static const _lightError = Color(0xFFD32F2F);
  static const _lightOnError = Color(0xFFFFFFFF);
  static const _lightOutline = Color(0xFFE0E0E0);

  // Dark Mode Colors
  static const _darkPrimary = Color(0xFF66B2FF);
  static const _darkOnPrimary = Color(0xFF003366);
  static const _darkSurface = Color(0xFF1E1E1E);
  static const _darkOnSurface = Color(0xFFEDEDED);
  static const _darkError = Color(0xFFEF5350);
  static const _darkOnError = Color(0xFF1E1E1E);
  static const _darkOutline = Color(0xFF3D3D3D);

  /// Returns a [ColorScheme] for light mode.
  static ColorScheme lightScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: _lightPrimary,
    onPrimary: _lightOnPrimary,
    secondary: _lightPrimary,
    onSecondary: _lightOnPrimary,
    surface: _lightSurface,
    onSurface: _lightOnSurface,
    error: _lightError,
    onError: _lightOnError,
    outline: _lightOutline,
  );

  /// Returns a [ColorScheme] for dark mode.
  static ColorScheme darkScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: _darkPrimary,
    onPrimary: _darkOnPrimary,
    secondary: _darkPrimary,
    onSecondary: _darkOnPrimary,
    surface: _darkSurface,
    onSurface: _darkOnSurface,
    error: _darkError,
    onError: _darkOnError,
    outline: _darkOutline,
  );
}
