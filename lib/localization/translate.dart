import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'app_locale_delegate.dart';

class Translate {
  final Locale locale;
  Map<String, String>? _localizedStrings;
  static const LocalizationsDelegate<Translate> delegate = AppLocaleDelegate();

  Translate(this.locale);

  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate)!;
  }

  Future<bool> load() async {
    String content = await rootBundle
        .loadString("assets/locale/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = jsonDecode(content);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    if (_localizedStrings![key] == null) {
      debugPrint("\"$key\": \"${_localizedStrings![key]}\",");
    }
    return _localizedStrings![key] ?? key;
  }

  bool get isRussian => locale.languageCode == 'ru';
}

extension TranslateString on String {
  String tr(BuildContext context) {
    return Translate.of(context).translate(this);
  }
}
