import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final Box settingsBox = Hive.box('settings');

  ThemeCubit() : super(ThemeMode.light) {
    final isDark = settingsBox.get('isDarkMode', defaultValue: false);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      settingsBox.put('isDarkMode', true);
    } else {
      emit(ThemeMode.light);
      settingsBox.put('isDarkMode', false);
    }
  }
}
