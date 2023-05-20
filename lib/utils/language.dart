class UtilLanguage {
  ///Get Language Global Language Name
  static String getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'ru':
        return 'Русский';
      case 'tm':
        return 'Türkmençe';
      default:
        return 'English';
    }
  }

  ///Singleton factory
  static final UtilLanguage _instance = UtilLanguage._internal();

  factory UtilLanguage() {
    return _instance;
  }
  UtilLanguage._internal();
}
