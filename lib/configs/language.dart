import 'package:flutter/material.dart';

class AppLanguage {
  /// Default Language
  static Locale defaultLanguage = const Locale("en");

  /// List language is supported in application
  static List<Locale> supportLanguage = [
    const Locale("en"),
    const Locale("ru"),
    const Locale("tk"),
  ];

  ///Singleton factory
  static final AppLanguage _instance = AppLanguage._internal();

  factory AppLanguage() {
    return _instance;
  }

  AppLanguage._internal();
}
