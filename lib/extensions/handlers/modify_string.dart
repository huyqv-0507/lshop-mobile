import 'package:intl/intl.dart';

class ModifyString {
  static String cropStr(String str) {
    str.replaceAll('Laptop', '');
    return str;
  }

  static String formatPriceVN(double price) {
    var format = NumberFormat.simpleCurrency(locale: 'vi_VN');
    String priceModify = format.format(price);
    return priceModify;
  }
}
