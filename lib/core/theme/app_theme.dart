import 'package:flutter/material.dart';
import 'package:todo_app/core/theme/app_color.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColor.lightModeAddButtonColor,
    onPrimary: AppColor.lightModeAddButtonIconColor,
    surface: AppColor.lightModeBackgroundColor,
    onSurface: AppColor.lightModePrimaryTextColor,
    secondary: AppColor.lightModeCardColor,
    onSecondary: AppColor.lightModePrimaryTextColor,
    tertiary: AppColor.lightModeUncheckedColor,
    onTertiary: AppColor.lightModePrimaryTextColor,
    error: Colors.red,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: AppColor.lightModeBackgroundColor,
  cardColor: AppColor.lightModeCardColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.lightModeCardColor,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.lightModePrimaryTextColor),
    titleTextStyle: TextStyle(
      color: AppColor.lightModePrimaryTextColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColor.lightModePrimaryTextColor),
    bodyMedium: TextStyle(color: AppColor.lightModePrimaryTextColor),
    bodySmall: TextStyle(color: AppColor.lightModeSecondaryTextColor),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.lightModeAddButtonColor,
    foregroundColor: AppColor.lightModeAddButtonIconColor,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.lightModeCheckedColor;
        }
        return AppColor.lightModeUncheckedColor;
      },
    ),
    checkColor: WidgetStateProperty.all(AppColor.lightModeAddButtonIconColor),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColor.lightModePopupBackgroundColor,
    textStyle: TextStyle(color: AppColor.lightModePopupTextColor),
    surfaceTintColor: Colors.transparent,
  ),

  dialogTheme: DialogThemeData(backgroundColor: AppColor.lightModeCardColor),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColor.darkModeAddButtonColor,
    onPrimary: AppColor.darkModeAddButtonIconColor,
    surface: AppColor.darkModeBackgroundColor,
    onSurface: AppColor.darkModePrimaryTextColor,
    secondary: AppColor.darkModeCardColor,
    onSecondary: AppColor.darkModePrimaryTextColor,
    tertiary: AppColor.darkModeUncheckedColor,
    onTertiary: AppColor.darkModePrimaryTextColor,
    error: Colors.red,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: AppColor.darkModeBackgroundColor,
  cardColor: AppColor.darkModeCardColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColor.darkModeCardColor,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.darkModePrimaryTextColor),
    titleTextStyle: TextStyle(
      color: AppColor.darkModePrimaryTextColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColor.darkModePrimaryTextColor),
    bodyMedium: TextStyle(color: AppColor.darkModePrimaryTextColor),
    bodySmall: TextStyle(color: AppColor.darkModeSecondaryTextColor),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.darkModeAddButtonColor,
    foregroundColor: AppColor.darkModeAddButtonIconColor,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.darkModeCheckedColor;
        }
        return AppColor.darkModeUncheckedColor;
      },
    ),
    checkColor: WidgetStateProperty.all(AppColor.darkModeAddButtonIconColor),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColor.darkModePopupBackgroundColor,
    textStyle: TextStyle(color: AppColor.darkModePopupTextColor),
    surfaceTintColor: Colors.transparent,
  ),


  dialogTheme: DialogThemeData(backgroundColor: AppColor.darkModeCardColor),
);
