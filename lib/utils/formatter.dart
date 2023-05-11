import 'package:intl/intl.dart';

class UtilFormatter {
  static String formatNumber(int number) {
    final tool = NumberFormat("#,##0", "en_US");
    return tool.format(number).replaceAll(",", ".");
  }
}
