
import 'package:taza/taza.dart';

extension CurrencyCodeFormatter on num {
  /// Format number with currency code.
  /// If [compact] is true, formats like 10K, 1M.
  String toCurrencyCodeFormat() {
    // TODO: Get currency code from user model dynamically
    String currencyCode = 'SAR';

    final format = NumberFormat.currency(
      name: currencyCode,
      symbol: '',
      decimalDigits: 0,
    );
    return "${format.format(this)} $currencyCode";
  }
}
