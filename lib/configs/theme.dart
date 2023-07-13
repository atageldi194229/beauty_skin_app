import 'package:beauty_skin/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData currentTheme = ThemeData(
    scaffoldBackgroundColor: COLOR_CONST.backgroundColor,
    appBarTheme: _appBarTheme,
    floatingActionButtonTheme: _floatingActionButtonTheme,
    textTheme: GoogleFonts.poppinsTextTheme(_textTheme),
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: COLOR_CONST.primaryColor,
    // ),
    // visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: _inputDecorationThem,
  );

  static const _floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: COLOR_CONST.primaryColor, // Colors.purple,
  );

  static const _appBarTheme = AppBarTheme(
    backgroundColor: COLOR_CONST.primaryColor,
  );

  static const _textTheme = TextTheme(
      // bodyLarge: TextStyle(color: COLOR_CONST.textColor),
      // bodyMedium: TextStyle(color: COLOR_CONST.textColor),
      );

  static const _inputDecorationThem = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: kDefaultPadding,
      vertical: kDefaultPadding * 2,
    ),
    // .copyWith(bottom: kDefaultPadding * 4),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: COLOR_CONST.textColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: COLOR_CONST.primaryColor),
    ),
    // hintStyle: FONT_CONST.REGULAR_DEFAULT,
    // labelStyle: FONT_CONST.REGULAR_DEFAULT,
  );

  /// Singleton factory
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
}
