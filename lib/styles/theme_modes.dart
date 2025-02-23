import 'package:google_fonts/google_fonts.dart';

import 'palettes.dart';
import 'text_styles.dart';
import 'package:flutter/material.dart';

final AppTextStyle _textStyle = AppTextStyle.instance;

ThemeData lightMode = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: Palettes.transparentColor),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Palettes.bgColor,
  primaryColor: Palettes.primaryColor,
  colorScheme: ColorScheme.light(
      primary: Palettes.primaryColor,
      secondary: Palettes.secondaryColor,
      tertiary: Palettes.blackColor,
      scrim: Palettes.whiteColor,
      outline: Palettes.greyColor),
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(color: Palettes.greyColor, width: 2),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (!states.contains(WidgetState.selected)) {
        return Palettes.transparentColor;
      }
      return Palettes.primaryColor;
    }),
  ),
  textTheme: GoogleFonts.dmSansTextTheme().copyWith(
    displayLarge: _textStyle.displayLarge,
    displayMedium: _textStyle.displayMedium,
    displaySmall: _textStyle.displaySmall,
    headlineLarge: _textStyle.headlineLarge,
    headlineMedium: _textStyle.headlineMedium,
    headlineSmall: _textStyle.headlineSmall,
    titleLarge: _textStyle.titleLarge,
    titleSmall: _textStyle.titleSmall,
    titleMedium: _textStyle.titleMedium,
    labelLarge: _textStyle.labelLarge,
    labelMedium: _textStyle.labelMedium,
    labelSmall: _textStyle.labelSmall,
    bodyLarge: _textStyle.bodyLarge,
    bodyMedium: _textStyle.bodyMedium,
    bodySmall: _textStyle.bodySmall,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    isDense: true,
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Palettes.redColor, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Palettes.greyColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Palettes.primaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Palettes.redColor, width: 2),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    hintStyle:
        TextStyle(color: Palettes.greyColor, fontWeight: FontWeight.normal),
  ),
);

ThemeData darkMode = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: Palettes.transparentColor),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Palettes.darkBgColor,
  primaryColor: Palettes.primaryColor,
  colorScheme: ColorScheme.dark(
    primary: Palettes.primaryColor,
    secondary: Palettes.secondaryColor,
    tertiary: Palettes.whiteColor,
    primaryContainer: Palettes.darkMenuColor,
  ),
  textTheme: GoogleFonts.dmSansTextTheme().copyWith(
    displayLarge: _textStyle.displayLarge.copyWith(color: Palettes.whiteColor),
    displayMedium:
        _textStyle.displayMedium.copyWith(color: Palettes.whiteColor),
    displaySmall: _textStyle.displaySmall.copyWith(color: Palettes.whiteColor),
    headlineLarge:
        _textStyle.headlineLarge.copyWith(color: Palettes.whiteColor),
    headlineMedium:
        _textStyle.headlineMedium.copyWith(color: Palettes.whiteColor),
    headlineSmall:
        _textStyle.headlineSmall.copyWith(color: Palettes.whiteColor),
    titleLarge: _textStyle.titleLarge.copyWith(color: Palettes.whiteColor),
    titleSmall: _textStyle.titleSmall.copyWith(color: Palettes.whiteColor),
    titleMedium: _textStyle.titleMedium.copyWith(color: Palettes.whiteTxtColor),
    labelLarge: _textStyle.labelLarge.copyWith(color: Palettes.whiteColor),
    labelMedium: _textStyle.labelMedium.copyWith(color: Palettes.whiteColor),
    labelSmall: _textStyle.labelSmall.copyWith(color: Palettes.whiteColor),
    bodyLarge: _textStyle.bodyLarge.copyWith(color: Palettes.whiteColor),
    bodyMedium: _textStyle.bodyMedium.copyWith(color: Palettes.whiteColor),
    bodySmall: _textStyle.bodySmall.copyWith(color: Palettes.whiteColor),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    isDense: true,
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Palettes.redColor, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Palettes.greyColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Palettes.primaryColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Palettes.redColor, width: 2),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    hintStyle:
        TextStyle(color: Palettes.greyColor, fontWeight: FontWeight.normal),
  ),
);
