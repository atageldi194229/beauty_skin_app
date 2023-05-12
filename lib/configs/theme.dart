import 'package:google_fonts/google_fonts.dart';
import 'package:beauty_skin/constants/color_constant.dart';
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
    // inputDecorationTheme: _inputDecorationThem,
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

  // static final _inputDecorationThem = InputDecorationTheme(
  // contentPadding:
  //     EdgeInsets.symmetric(horizontal: SizeConfig.defaultPadding * 1.2),
  // border: const OutlineInputBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(5)),
  //   borderSide: BorderSide(color: COLOR_CONST.textColor),
  // ),
  // hintStyle: FONT_CONST.REGULAR_DEFAULT_20,
  // );

  /// Singleton factory
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._internal();
}
