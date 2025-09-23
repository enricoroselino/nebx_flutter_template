import 'package:flutter/material.dart';
import 'package:nebx_flutter_template/core/themes/tokens/app_colors.dart';
import 'package:nebx_flutter_template/core/themes/tokens/app_typography.dart';
import 'package:nebx_flutter_template/core/themes/tokens/app_spacing.dart';
import 'package:nebx_flutter_template/core/themes/tokens/app_radius.dart';

class AppTheme {
  /// Light Theme
  static ThemeData light() {
    final scheme = AppColors.lightScheme;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: scheme,
      splashFactory: NoSplash.splashFactory,

      // Typography
      textTheme: TextTheme(
        displayLarge: AppTypography.h1.copyWith(color: scheme.onSurface),
        displayMedium: AppTypography.h2.copyWith(color: scheme.onSurface),
        bodyLarge: AppTypography.body.copyWith(color: scheme.onSurface),
        bodyMedium: AppTypography.bodySmall.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        labelSmall: AppTypography.caption.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: AppTypography.body.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: scheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: AppTypography.body,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          textStyle: AppTypography.bodySmall.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Input Fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: scheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: scheme.error),
        ),
        labelStyle: AppTypography.bodySmall.copyWith(color: scheme.onSurface),
        hintStyle: AppTypography.bodySmall.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),

      // Cards
      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: BorderSide(color: scheme.outlineVariant), // semantic variant
        ),
      ),

      // Dialogs
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        titleTextStyle: AppTypography.h2.copyWith(color: scheme.onSurface),
        contentTextStyle: AppTypography.body.copyWith(color: scheme.onSurface),
      ),

      // SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: scheme.surface,
        contentTextStyle: AppTypography.body.copyWith(color: scheme.onSurface),
        behavior: SnackBarBehavior.floating,
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: AppSpacing.md,
      ),

      // Icon theme
      iconTheme: IconThemeData(color: scheme.onSurface),

      // Bottom navigation theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.surface,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurfaceVariant,
        selectedLabelStyle: AppTypography.bodySmall.copyWith(
          color: scheme.primary,
        ),
        unselectedLabelStyle: AppTypography.bodySmall.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  /// Dark Theme
  static ThemeData dark() {
    final scheme = AppColors.darkScheme;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      splashFactory: NoSplash.splashFactory,

      textTheme: TextTheme(
        displayLarge: AppTypography.h1.copyWith(color: scheme.onSurface),
        displayMedium: AppTypography.h2.copyWith(color: scheme.onSurface),
        bodyLarge: AppTypography.body.copyWith(color: scheme.onSurface),
        bodyMedium: AppTypography.bodySmall.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        labelSmall: AppTypography.caption.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: true,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: AppTypography.body.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.primary,
          side: BorderSide(color: scheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: AppTypography.body,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          textStyle: AppTypography.bodySmall.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: scheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: scheme.error),
        ),
        labelStyle: AppTypography.bodySmall.copyWith(color: scheme.onSurface),
        hintStyle: AppTypography.bodySmall.copyWith(
          color: scheme.onSurfaceVariant,
        ),
      ),

      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        titleTextStyle: AppTypography.h2.copyWith(color: scheme.onSurface),
        contentTextStyle: AppTypography.body.copyWith(color: scheme.onSurface),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: scheme.surface,
        contentTextStyle: AppTypography.body.copyWith(color: scheme.onSurface),
        behavior: SnackBarBehavior.floating,
      ),

      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: AppSpacing.md,
      ),

      iconTheme: IconThemeData(color: scheme.onSurface),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.surface,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurfaceVariant,
        selectedLabelStyle: AppTypography.bodySmall.copyWith(
          color: scheme.primary,
        ),
        unselectedLabelStyle: AppTypography.bodySmall.copyWith(
          color: scheme.onSurfaceVariant,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
