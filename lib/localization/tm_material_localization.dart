import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbols.dart' as intl;
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;

const tmLocaleDatePatterns = {
  'd': 'd.',
  'E': 'ccc',
  'EEEE': 'cccc',
  'LLL': 'LLL',
  'LLLL': 'LLLL',
  'M': 'L.',
  'Md': 'd.M.',
  'MEd': 'EEE d.M.',
  'MMM': 'LLL',
  'MMMd': 'd. MMM',
  'MMMEd': 'EEE d. MMM',
  'MMMM': 'LLLL',
  'MMMMd': 'd. MMMM',
  'MMMMEEEEd': 'EEEE d. MMMM',
  'QQQ': 'QQQ',
  'QQQQ': 'QQQQ',
  'y': 'y',
  'yM': 'M.y',
  'yMd': 'd.M.y',
  'yMEd': 'EEE d.MM.y',
  'yMMM': 'MMM y',
  'yMMMd': 'd. MMM y',
  'yMMMEd': 'EEE d. MMM y',
  'yMMMM': 'MMMM y',
  'yMMMMd': 'd. MMMM y',
  'yMMMMEEEEd': 'EEEE d. MMMM y',
  'yQQQ': 'QQQ y',
  'yQQQQ': 'QQQQ y',
  'H': 'HH',
  'Hm': 'HH:mm',
  'Hms': 'HH:mm:ss',
  'j': 'HH',
  'jm': 'HH:mm',
  'jms': 'HH:mm:ss',
  'jmv': 'HH:mm v',
  'jmz': 'HH:mm z',
  'jz': 'HH z',
  'm': 'm',
  'ms': 'mm:ss',
  's': 's',
  'v': 'v',
  'z': 'z',
  'zzzz': 'zzzz',
  'ZZZZ': 'ZZZZ',
};

const tmDateSymbols = {
  'NAME': 'tm_TM',
  'ERAS': <dynamic>[
    'f.Kr.',
    'e.Kr.',
  ],
// #enddocregion Date2
  'ERANAMES': <dynamic>[
    'før Kristus',
    'etter Kristus',
  ],
  'NARROWMONTHS': <dynamic>[
    'Ý',
    'F',
    'M',
    'A',
    'M',
    'I',
    'I',
    'A',
    'S',
    'O',
    'N',
    'D',
  ],
  'STANDALONENARROWMONTHS': <dynamic>[
    'Ý',
    'F',
    'M',
    'A',
    'M',
    'I',
    'I',
    'A',
    'S',
    'O',
    'N',
    'D',
  ],
  'MONTHS': <dynamic>[
    'Ýanwar',
    'Fewral',
    'Mart',
    'Aprel',
    'Maý',
    'Iýun',
    'Iýul',
    'Awgust',
    'Dentýabr',
    'Oktýabr',
    'Noýabr',
    'Dekabr',
  ],
  'STANDALONEMONTHS': <dynamic>[
    'Ýanwar',
    'Fewral',
    'Mart',
    'Aprel',
    'Maý',
    'Iýun',
    'Iýul',
    'Awgust',
    'Dentýabr',
    'Oktýabr',
    'Noýabr',
    'Dekabr',
  ],
  'SHORTMONTHS': <dynamic>[
    'ýan.',
    'few.',
    'mart.',
    'apr.',
    'maý.',
    'iýun.',
    'iýul.',
    'awg.',
    'sen.',
    'okt.',
    'noý.',
    'dek.',
  ],
  'STANDALONESHORTMONTHS': <dynamic>[
    'ýan',
    'few',
    'mart',
    'apr',
    'maý',
    'iýun',
    'iýul',
    'awg',
    'sen',
    'okt',
    'noý',
    'dek',
  ],
  'WEEKDAYS': <dynamic>[
    'ýekşenbe',
    'duşenbe',
    'sişenbe',
    'çarşenbe',
    'penşenbe',
    'anna',
    'şenbe',
  ],
  'STANDALONEWEEKDAYS': <dynamic>[
    'ýekşenbe',
    'duşenbe',
    'sişenbe',
    'çarşenbe',
    'penşenbe',
    'anna',
    'şenbe',
  ],
  'SHORTWEEKDAYS': <dynamic>[
    'ýek.',
    'du.',
    'si.',
    'ça.',
    'pe.',
    'an.',
    'şe.',
  ],
  'STANDALONESHORTWEEKDAYS': <dynamic>[
    'ýek',
    'du',
    'si',
    'ça',
    'pe',
    'an',
    'şe',
  ],
  'NARROWWEEKDAYS': <dynamic>[
    'Ý',
    'D',
    'S',
    'Ç',
    'P',
    'A',
    'Ş',
  ],
  'STANDALONENARROWWEEKDAYS': <dynamic>[
    'Ý',
    'D',
    'S',
    'Ç',
    'P',
    'A',
    'Ş',
  ],
  'SHORTQUARTERS': <dynamic>[
    'K1',
    'K2',
    'K3',
    'K4',
  ],
  'QUARTERS': <dynamic>[
    '1. kvartal',
    '2. kvartal',
    '3. kvartal',
    '4. kvartal',
  ],
  'AMPMS': <dynamic>[
    'a.m.',
    'p.m.',
  ],
  'DATEFORMATS': <dynamic>[
    'EEEE d. MMMM y',
    'd. MMMM y',
    'd. MMM y',
    'dd.MM.y',
  ],
  'TIMEFORMATS': <dynamic>[
    'HH:mm:ss zzzz',
    'HH:mm:ss z',
    'HH:mm:ss',
    'HH:mm',
  ],
  'AVAILABLEFORMATS': null,
  'FIRSTDAYOFWEEK': 1,
  'WEEKENDRANGE': <dynamic>[
    6,
    7,
  ],
  'FIRSTWEEKCUTOFFDAY': 3,
  'DATETIMEFORMATS': <dynamic>[
    '{1} {0}',
    '{1} \'kl\'. {0}',
    '{1}, {0}',
    '{1}, {0}',
  ],
};

class _TkMaterialLocalization extends LocalizationsDelegate<MaterialLocalizations> {
  const _TkMaterialLocalization();

  @override
  bool isSupported(Locale locale) => locale.countryCode == "TM" && locale.languageCode == "tm";
  @override
  bool shouldReload(covariant LocalizationsDelegate<MaterialLocalizations> old) => false;

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    final String localeName = intl.Intl.canonicalizedLocale(locale.toString());
    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: tmLocaleDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(tmDateSymbols),
    );
    return SynchronousFuture<MaterialLocalizations>(
      TmMaterialLocalization(
        localeName: localeName,
        fullYearFormat: intl.DateFormat('y', localeName),
        compactDateFormat: intl.DateFormat('yMd', localeName),
        shortDateFormat: intl.DateFormat('yMMMd', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        shortMonthDayFormat: intl.DateFormat('MMM d', localeName),
        decimalFormat: intl.NumberFormat('#,##0.###', 'en_US'),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00', 'en_US'),
      ),
    );
  }
}

class TmMaterialLocalization extends GlobalMaterialLocalizations {
  const TmMaterialLocalization({
    String localeName = 'tm_TM',
    required intl.DateFormat fullYearFormat,
    required intl.DateFormat compactDateFormat,
    required intl.DateFormat shortDateFormat,
    required intl.DateFormat mediumDateFormat,
    required intl.DateFormat longDateFormat,
    required intl.DateFormat yearMonthFormat,
    required intl.DateFormat shortMonthDayFormat,
    required intl.NumberFormat decimalFormat,
    required intl.NumberFormat twoDigitZeroPaddedFormat,
  }) : super(
          localeName: localeName,
          fullYearFormat: fullYearFormat,
          compactDateFormat: compactDateFormat,
          shortDateFormat: shortDateFormat,
          mediumDateFormat: mediumDateFormat,
          longDateFormat: longDateFormat,
          yearMonthFormat: yearMonthFormat,
          shortMonthDayFormat: shortMonthDayFormat,
          decimalFormat: decimalFormat,
          twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat,
        );

  static const LocalizationsDelegate<MaterialLocalizations> delegate = _TkMaterialLocalization();

  static const List<String> _weekdays = <String>[
    'Ýekşenbe',
    'Duşenbe',
    'Sişenbe',
    'Çarşenbe',
    'Penşenbe',
    'Anna',
    'Şenbe',
  ];

  static const List<String> _narrowWeekdays = <String>['Ý', 'D', 'S', 'Ç', 'P', 'A', 'Ş'];

  static const List<String> _shortWeekdays = <String>[
    'Ýek',
    'Du',
    'Si',
    'Ça',
    'Pe',
    'An',
    'Şe',
  ];

  static const List<String> _shortMonths = <String>[
    'Ýan',
    'Few',
    'Mar',
    'Apr',
    'Maý',
    'Iýn',
    'Iýl',
    'Awg',
    'Sen',
    'Okt',
    'Noý',
    'Dek',
  ];

  static const List<String> _months = <String>[
    'Ýanwar',
    'Fewral',
    'Mart',
    'Aprel',
    'Maý',
    'Iýun',
    'Iýul',
    'Awgust',
    'Sentýabr',
    'Oktýabr',
    'Noýabr',
    'Dekabr',
  ];

  @override
  String get aboutListTileTitleRaw => r'$applicationName: hakynda';

  @override
  String get alertDialogLabel => r'Bildiriş';

  @override
  String get anteMeridiemAbbreviation => r'IRDEN';

  @override
  String get backButtonTooltip => r'Yza';

  @override
  String get calendarModeButtonLabel => r'Kalendara geçmek';

  @override
  String get cancelButtonLabel => r'ÝATYRMAK';

  @override
  String get closeButtonLabel => r'ÝAPMAK';

  @override
  String get closeButtonTooltip => r'Ýapmak';

  @override
  String get collapsedIconTapHint => r'Giňeltmek';

  @override
  String get continueButtonLabel => r'DOWAM ETMEK';

  @override
  String get copyButtonLabel => r'KOPIÝASYNY ALMAK';

  @override
  String get cutButtonLabel => r'KESIP ALMAK';

  @override
  String get dateHelpText => r'dd.mm.yyyy';

  @override
  String get dateInputLabel => r'Senäni giriziň';

  @override
  String get dateOutOfRangeLabel => r'Çäkden çykylan';

  @override
  String get datePickerHelpText => r'Senäni saýlaň';

  @override
  String get dateRangeEndDateSemanticLabelRaw => r'Soňky sene $fullDate';

  @override
  String get dateRangeEndLabel => r'Gutarýan senesi';

  @override
  String get dateRangePickerHelpText => r'Çägini saýlaň';

  @override
  String get dateRangeStartDateSemanticLabelRaw => 'Başlanýan senesi \$fullDate';

  @override
  String get dateRangeStartLabel => 'Başlanýan senesi';

  @override
  String get dateSeparator => '.';

  @override
  String get deleteButtonTooltip => r'Pozmak';

  @override
  String get dialModeButtonLabel => r'Girizmek usulynyň saýlamagyna geçmek';

  @override
  String get dialogLabel => r'Dialog';

  @override
  String get drawerLabel => r'Menýü nawigasiýasy';

  @override
  String get expandedIconTapHint => r'Kiçeltmek';

  @override
  String get hideAccountsLabel => r'Hasaplary gizlemek';

  @override
  String get inputDateModeButtonLabel => r'Girizmek režimine geçmek';

  @override
  String get inputTimeModeButtonLabel => r'Tekst girizmek režimine geçmek';

  @override
  String get invalidDateFormatLabel => r'Nädogry format';

  @override
  String get invalidDateRangeLabel => r'Nädogry çäk';

  @override
  String get invalidTimeLabel => r'Dogry wagty giriziň';

  @override
  String licensesPackageDetailText(int licenseCount) {
    assert(licenseCount >= 0);
    switch (licenseCount) {
      case 0:
        return 'Ygtyýarnama ýök.';
      case 1:
        return '1 sany ygtyýarnama.';
      default:
        return '$licenseCount sany ygtyýarnama.';
    }
  }

  @override
  String get licensesPackageDetailTextOther => '\$licenseCount sany ygtyýarnama';

  @override
  String get licensesPageTitle => r'Ygtyýarnama';

  @override
  String get modalBarrierDismissLabel => r'Ýapmak';

  @override
  String get moreButtonTooltip => r'Köpräk';

  @override
  String get nextMonthTooltip => 'Indiki aý';

  @override
  String get nextPageTooltip => r'Indiki sahypa';

  @override
  String get okButtonLabel => r'Bolýar';

  @override
  String get openAppDrawerTooltip => r'Nawigasiýa menýüsyny açyň';

  @override
  String get pageRowsInfoTitleApproximateRaw => r'$firstRow–$lastRow / takmynan $rowCount';

  @override
  String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow / $rowCount';

  @override
  String get pasteButtonLabel => r'GOÝMAK';

  @override
  String get popupMenuLabel => r'Ýuze çykýan menýü';

  @override
  String get postMeridiemAbbreviation => r'Öýlän';

  @override
  String get previousMonthTooltip => r'Öňki aý';

  @override
  String get previousPageTooltip => r'Öňki sahypa';

  @override
  String get refreshIndicatorSemanticLabel => r'Tazelenme';

  @override
  String get remainingTextFieldCharacterCountOther => r'$remainingCount simwolar galdy';

  @override
  String get remainingTextFieldCharacterCountZero => r'Simwol galmady';

  @override
  String get reorderItemDown => r'Aşak geçirmek';

  @override
  String get reorderItemLeft => r'Çepe geçirmek';

  @override
  String get reorderItemRight => r'Saga geçirmek';

  @override
  String get reorderItemToEnd => r'Soňyna geçirmek';

  @override
  String get reorderItemToStart => r'Başyna geçirmek';

  @override
  String get reorderItemUp => r'Ýokaryk geçirmek';

  @override
  String get rowsPerPageTitle => r'Sahypada setirler:';

  @override
  String get saveButtonLabel => 'ÝATDA SAKLAMAK';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => r'Gözleg';

  @override
  String get selectAllButtonLabel => r'HEMMESINI SAÝLAMAK';

  @override
  String get selectYearSemanticsLabel => 'Ýyly saýlaň';

  @override
  String get selectedRowCountTitleOther => r'$selectedRowCount element saýlanan';

  @override
  String get showAccountsLabel => r'Hasaplary görkezmek';

  @override
  String get showMenuTooltip => r'Menýüny görkez';

  @override
  String get signedInLabel => r'Giriş edildi';

  @override
  String get tabLabelRaw => r'$tabIndex / $tabCount goşmaça goýlan sahypa';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.HH_colon_mm;

  @override
  String get timePickerDialHelpText => 'WAGTY SAÝLAŇ';

  @override
  String get timePickerHourLabel => 'Sagat';

  @override
  String get timePickerHourModeAnnouncement => r'Sagat saýlaň';

  @override
  String get timePickerInputHelpText => 'Wagty giriziň';

  @override
  String get timePickerMinuteLabel => 'Minut';

  @override
  String get timePickerMinuteModeAnnouncement => r'Minut saýlaň';

  @override
  String get unspecifiedDate => 'Sene';

  @override
  String get unspecifiedDateRange => 'Seneleriň çägi';

  @override
  String get viewLicensesButtonLabel => r'YGTYÝARNAMALARY GÖRMEK';

  @override
  List<String> get narrowWeekdays => _narrowWeekdays;

  @override
  int get firstDayOfWeekIndex => 1;

  @override
  String formatMediumDate(DateTime date) {
    final String day = _shortWeekdays[date.weekday - DateTime.monday];
    final String month = _shortMonths[date.month - DateTime.january];
    return '$day, $month ${date.day}';
  }

  @override
  String formatDecimal(int number) {
    if (number > -1000 && number < 1000) return number.toString();

    final String digits = number.abs().toString();
    final StringBuffer result = StringBuffer(number < 0 ? '-' : '');
    final int maxDigitIndex = digits.length - 1;
    for (int i = 0; i <= maxDigitIndex; i += 1) {
      result.write(digits[i]);
      if (i < maxDigitIndex && (maxDigitIndex - i) % 3 == 0) result.write(',');
    }
    return result.toString();
  }

  @override
  String formatCompactDate(DateTime date) {
    // Assumes US mm/dd/yyyy format
    final String month = _formatTwoDigitZeroPad(date.month);
    final String day = _formatTwoDigitZeroPad(date.day);
    final String year = date.year.toString().padLeft(4, '0');
    return '$day.$month.$year';
  }

  @override
  String formatShortDate(DateTime date) {
    final String month = _shortMonths[date.month - DateTime.january];
    return '$month ${date.day}, ${date.year}';
  }

  String _formatTwoDigitZeroPad(int number) {
    assert(0 <= number && number < 100);

    if (number < 10) return '0$number';

    return '$number';
  }

  @override
  String formatFullDate(DateTime date) {
    final String month = _months[date.month - DateTime.january];
    return '${_weekdays[date.weekday - DateTime.monday]}, $month ${date.day}, ${date.year}';
  }

  @override
  String formatMonthYear(DateTime date) {
    final String year = formatYear(date);
    final String month = _months[date.month - DateTime.january];
    return '$month $year';
  }

  @override
  DateTime? parseCompactDate(String? inputString) {
    if (inputString == null) {
      return null;
    }

    // Assumes US mm/dd/yyyy format
    final List<String> inputParts = inputString.split('.');
    if (inputParts.length != 3) {
      return null;
    }

    final int? year = int.tryParse(inputParts[2], radix: 10);
    if (year == null || year < 1) {
      return null;
    }

    final int? month = int.tryParse(inputParts[0], radix: 10);
    if (month == null || month < 1 || month > 12) {
      return null;
    }

    final int? day = int.tryParse(inputParts[1], radix: 10);
    if (day == null || day < 1 || day > _getDaysInMonth(year, month)) {
      return null;
    }
    return DateTime(year, month, day);
  }

  int _getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      if (isLeapYear) return 29;
      return 28;
    }
    const List<int> daysInMonth = <int>[31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysInMonth[month - 1];
  }

  @override
  String formatShortMonthDay(DateTime date) {
    final String month = _shortMonths[date.month - DateTime.january];
    return '$month ${date.day}';
  }

  @override
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false}) {
    return TimeOfDayFormat.HH_colon_mm;
  }

  @override
  String formatTimeOfDay(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    final StringBuffer buffer = StringBuffer();
    buffer
      ..write(formatHour(timeOfDay, alwaysUse24HourFormat: true))
      ..write(':')
      ..write(formatMinute(timeOfDay));

    return '$buffer';
  }

  @override
  String get firstPageTooltip => 'Baş sahypa';

  @override
  String get lastPageTooltip => 'Soňky sahypa';

  @override
  String get keyboardKeyAlt => const DefaultMaterialLocalizations().keyboardKeyAlt;

  @override
  String get keyboardKeyAltGraph => const DefaultMaterialLocalizations().keyboardKeyAltGraph;

  @override
  String get keyboardKeyBackspace => const DefaultMaterialLocalizations().keyboardKeyBackspace;

  @override
  String get keyboardKeyCapsLock => const DefaultMaterialLocalizations().keyboardKeyCapsLock;

  @override
  String get keyboardKeyChannelDown => const DefaultMaterialLocalizations().keyboardKeyChannelDown;

  @override
  String get keyboardKeyChannelUp => const DefaultMaterialLocalizations().keyboardKeyChannelUp;

  @override
  String get keyboardKeyControl => const DefaultMaterialLocalizations().keyboardKeyControl;

  @override
  String get keyboardKeyDelete => const DefaultMaterialLocalizations().keyboardKeyDelete;

  @override
  String get keyboardKeyEject => const DefaultMaterialLocalizations().keyboardKeyEject;

  @override
  String get keyboardKeyEnd => const DefaultMaterialLocalizations().keyboardKeyEnd;

  @override
  String get keyboardKeyEscape => const DefaultMaterialLocalizations().keyboardKeyEscape;

  @override
  String get keyboardKeyFn => const DefaultMaterialLocalizations().keyboardKeyFn;

  @override
  String get keyboardKeyHome => const DefaultMaterialLocalizations().keyboardKeyHome;

  @override
  String get keyboardKeyInsert => const DefaultMaterialLocalizations().keyboardKeyInsert;

  @override
  String get keyboardKeyMeta => const DefaultMaterialLocalizations().keyboardKeyMeta;

  @override
  String get keyboardKeyMetaMacOs => const DefaultMaterialLocalizations().keyboardKeyMetaMacOs;

  @override
  String get keyboardKeyMetaWindows => const DefaultMaterialLocalizations().keyboardKeyMetaWindows;

  @override
  String get keyboardKeyNumLock => const DefaultMaterialLocalizations().keyboardKeyNumLock;

  @override
  String get keyboardKeyNumpad0 => const DefaultMaterialLocalizations().keyboardKeyNumpad0;

  @override
  String get keyboardKeyNumpad1 => const DefaultMaterialLocalizations().keyboardKeyNumpad1;

  @override
  String get keyboardKeyNumpad2 => const DefaultMaterialLocalizations().keyboardKeyNumpad2;

  @override
  String get keyboardKeyNumpad3 => const DefaultMaterialLocalizations().keyboardKeyNumpad3;

  @override
  String get keyboardKeyNumpad4 => const DefaultMaterialLocalizations().keyboardKeyNumpad4;

  @override
  String get keyboardKeyNumpad5 => const DefaultMaterialLocalizations().keyboardKeyNumpad5;

  @override
  String get keyboardKeyNumpad6 => const DefaultMaterialLocalizations().keyboardKeyNumpad6;

  @override
  String get keyboardKeyNumpad7 => const DefaultMaterialLocalizations().keyboardKeyNumpad7;

  @override
  String get keyboardKeyNumpad8 => const DefaultMaterialLocalizations().keyboardKeyNumpad8;

  @override
  String get keyboardKeyNumpad9 => const DefaultMaterialLocalizations().keyboardKeyNumpad9;

  @override
  String get keyboardKeyNumpadAdd => const DefaultMaterialLocalizations().keyboardKeyNumpadAdd;

  @override
  String get keyboardKeyNumpadComma => const DefaultMaterialLocalizations().keyboardKeyNumpadComma;

  @override
  String get keyboardKeyNumpadDecimal => const DefaultMaterialLocalizations().keyboardKeyNumpadDecimal;

  @override
  String get keyboardKeyNumpadDivide => const DefaultMaterialLocalizations().keyboardKeyNumpadDivide;

  @override
  String get keyboardKeyNumpadEnter => const DefaultMaterialLocalizations().keyboardKeyNumpadEnter;

  @override
  String get keyboardKeyNumpadEqual => const DefaultMaterialLocalizations().keyboardKeyNumpadEqual;

  @override
  String get keyboardKeyNumpadMultiply => const DefaultMaterialLocalizations().keyboardKeyNumpadMultiply;

  @override
  String get keyboardKeyNumpadParenLeft => const DefaultMaterialLocalizations().keyboardKeyNumpadParenLeft;

  @override
  String get keyboardKeyNumpadParenRight => const DefaultMaterialLocalizations().keyboardKeyNumpadParenRight;

  @override
  String get keyboardKeyNumpadSubtract => const DefaultMaterialLocalizations().keyboardKeyNumpadSubtract;

  @override
  String get keyboardKeyPageDown => const DefaultMaterialLocalizations().keyboardKeyPageDown;

  @override
  String get keyboardKeyPageUp => const DefaultMaterialLocalizations().keyboardKeyPageUp;

  @override
  String get keyboardKeyPower => const DefaultMaterialLocalizations().keyboardKeyPower;

  @override
  String get keyboardKeyPowerOff => const DefaultMaterialLocalizations().keyboardKeyPowerOff;

  @override
  String get keyboardKeyPrintScreen => const DefaultMaterialLocalizations().keyboardKeyPrintScreen;

  @override
  String get keyboardKeyScrollLock => const DefaultMaterialLocalizations().keyboardKeyScrollLock;

  @override
  String get keyboardKeySelect => const DefaultMaterialLocalizations().keyboardKeySelect;

  @override
  String get keyboardKeySpace => const DefaultMaterialLocalizations().keyboardKeySpace;

  @override
  String get menuBarMenuLabel => const DefaultMaterialLocalizations().menuBarMenuLabel;

  @override
  String get bottomSheetLabel => const DefaultMaterialLocalizations().bottomSheetLabel;

  @override
  String get currentDateLabel => const DefaultMaterialLocalizations().currentDateLabel;

  @override
  String get keyboardKeyShift => const DefaultMaterialLocalizations().keyboardKeyShift;

  @override
  String get scrimLabel => const DefaultMaterialLocalizations().scrimLabel;

  @override
  String get scrimOnTapHintRaw => const DefaultMaterialLocalizations().scrimOnTapHint(r'$modalRouteContentName');

  @override
  String get collapsedHint => const DefaultMaterialLocalizations().collapsedHint;

  @override
  String get expandedHint => const DefaultMaterialLocalizations().expandedHint;

  @override
  String get expansionTileCollapsedHint => const DefaultMaterialLocalizations().expansionTileCollapsedHint;

  @override
  String get expansionTileCollapsedTapHint => const DefaultMaterialLocalizations().expansionTileCollapsedTapHint;

  @override
  String get expansionTileExpandedHint => const DefaultMaterialLocalizations().expansionTileExpandedHint;

  @override
  String get expansionTileExpandedTapHint => const DefaultMaterialLocalizations().expansionTileExpandedTapHint;

  @override
  String get scanTextButtonLabel => const DefaultMaterialLocalizations().scanTextButtonLabel;

  @override
  String get lookUpButtonLabel => const DefaultMaterialLocalizations().lookUpButtonLabel;

  @override
  String get menuDismissLabel => const DefaultMaterialLocalizations().menuDismissLabel;

  @override
  String get searchWebButtonLabel => const DefaultMaterialLocalizations().searchWebButtonLabel;

  @override
  String get shareButtonLabel => const DefaultMaterialLocalizations().shareButtonLabel;
}
