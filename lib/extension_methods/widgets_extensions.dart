import 'package:taza/taza.dart';

extension SizeBoxExtension on num {
  /// Returns a `SizedBox` with height equal to the given number.
  SizedBox get height => SizedBox(height: toDouble().h);

  /// Returns a `SizedBox` with width equal to the given number.
  SizedBox get width => SizedBox(width: toDouble().w);
}