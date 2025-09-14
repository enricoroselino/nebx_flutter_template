import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/shared_preferences.dart';
import 'package:nebx_flutter_template/setup_dependencies.dart';

class AppThemeNotifier extends AsyncNotifier<ThemeMode> {
  final ISharedPreferences _pref;

  AppThemeNotifier(this._pref);

  static const String _themeKey = "APP_THEME_MODE_KEY";

  @override
  Future<ThemeMode> build() async {
    final isDarkMode = await _pref.getInt(_themeKey);
    if (isDarkMode == null) return ThemeMode.system;

    return isDarkMode == 1 ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setLightTheme() async {
    await _pref.setInt(_themeKey, 0);
    state = const AsyncValue.data(ThemeMode.light);
  }

  Future<void> setDarkTheme() async {
    await _pref.setInt(_themeKey, 1);
    state = const AsyncValue.data(ThemeMode.dark);
  }
}

final appThemeProvider = AsyncNotifierProvider<AppThemeNotifier, ThemeMode>(() {
  final pref = locator.get<ISharedPreferences>();
  return AppThemeNotifier(pref);
});
