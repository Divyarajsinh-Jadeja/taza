import 'package:taza/taza.dart';

extension DateTimeExt on DateTime {
  DateTime get monthStart => DateTime(year, month);

  DateTime get monthEnd => DateTime(year, month + 1, 0);

  DateTime get dayStart => DateTime(year, month, day);

  DateTime get findFirstDateOfTheWeek => subtract(Duration(days: weekday - 1));

  DateTime get findLastDateOfTheWeek => add(Duration(days: DateTime.daysPerWeek - weekday));

  DateTime addMonth(int count) {
    return DateTime(year, month + count, day);
  }

  String dateToStringFormat({required String outputDateFormat}) {
    DateFormat dateFormat = DateFormat(outputDateFormat);
    return dateFormat.format(this);
  }

  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  bool get isToday {
    return isSameDate(DateTime.now());
  }

  bool get isYesterday {
    return isSameDate(DateTime.now().subtract(const Duration(days: 1)));
  }

  double toNumber() {
    double result = 0;
    result = hour.toDouble();
    result += (minute) / 60;
    result += (second) / 3600;
    return result;
  }

  /// Returns a formatted string representing the date with a suffix for the day.
  ///
  /// This getter method formats the current `DateTime` instance into a string
  /// that includes the day with an appropriate suffix (st, nd, rd, th), the full month name,
  /// and the year. For example, "1st January 2024".
  ///
  /// The suffix is determined based on the day of the month:
  /// - "st" for days ending in 1, except 11
  /// - "nd" for days ending in 2, except 12
  /// - "rd" for days ending in 3, except 13
  /// - "th" for all other days
  ///
  /// Returns a formatted string representing the date with a suffix.
  String get formatDateWithSuffix {
    final day = this.day;
    final month = DateFormat.MMMM().format(this);
    final year = this.year;
    String suffix = 'th';

    if (day % 10 == 1 && day != 11) {
      suffix = 'st';
    } else if (day % 10 == 2 && day != 12) {
      suffix = 'nd';
    } else if (day % 10 == 3 && day != 13) {
      suffix = 'rd';
    }

    return '$day$suffix $month $year';
  }

  String get monthNameShort {
    return DateFormat.MMM().format(this);
  }

  String get monthNameFull {
    return DateFormat.MMMM().format(this);
  }

  /// Returns a formatted string representing the relative time ago for the current `DateTime` instance.
  ///
  /// This getter method determines how long ago the current `DateTime` instance was
  /// and returns a formatted string accordingly. If the date is today, it returns the time
  /// in 24-hour format. If the date is yesterday, it returns a localized string for "yesterday".
  /// If the date is within the current week, it returns the full day name. Otherwise, it returns
  /// the date in `DD MMM YYYY` format.
  // String get timeAgo {
  //   String date;
  //
  //   if (isToday) {
  //     date = dateToStringFormat(outputDateFormat: DateFormatter.timeFormat12H);
  //   } else if (isYesterday) {
  //     date = APPStrings.yesterday.tr;
  //   } else if (isInCurrentWeek) {
  //     // Display full day name if within the current week
  //     date = dateToStringFormat(
  //       outputDateFormat: DateFormatter.dateFormatEEEE, // EEEE format returns full day name (e.g., Monday, Tuesday)
  //     );
  //   } else {
  //     // Display formatted date for older dates
  //     date = dateToStringFormat(
  //       outputDateFormat: DateFormatter.dateFormatDDMMMYYYY,
  //     );
  //   }
  //
  //   return date;
  // }

  /// Checks if the current `DateTime` instance is within the current week.
  ///
  /// This getter method determines if the current `DateTime` instance falls within
  /// the current week, starting from Monday and ending on Sunday.
  ///
  /// Returns `true` if the date is within the current week, otherwise `false`.
  bool get isInCurrentWeek {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // Start of the current week (Monday)
    final endOfWeek = startOfWeek.add(const Duration(days: 6)); // End of the current week (Sunday)
    return isAfter(startOfWeek) && isBefore(endOfWeek.add(const Duration(days: 1)));
  }
}
