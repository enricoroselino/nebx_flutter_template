import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nebx_flutter_template/core/blocs/theme_event.dart';
import 'package:nebx_flutter_template/core/blocs/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.system)) {
    on<ToggleThemeEvent>((event, emit) {
      emit(state.copyWith(themeMode: ThemeMode.dark));
    });

    on<SetThemeEvent>((event, emit) {
      emit(state.copyWith(themeMode: event.themeMode));
    });
  }
}
