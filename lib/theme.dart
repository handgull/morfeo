import 'package:flutter/material.dart';

class LightTheme {
  static final primaryColor = Colors.green[500]!;
  static final secondaryColor = Colors.green[700]!;

  static ThemeData get make => ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: AppBarTheme(color: primaryColor),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          alignLabelWithHint: true,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 17 / 14,
          ),
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 17 / 14,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: secondaryColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
        snackBarTheme: SnackBarThemeData(backgroundColor: Colors.grey[900]),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      );
}
