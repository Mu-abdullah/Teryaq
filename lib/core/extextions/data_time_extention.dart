import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  /// تنسيق التاريخ فقط: yyyy/MM/dd
  String get formattedDate => DateFormat('yyyy/MM/dd').format(this);

  /// تنسيق الوقت فقط: hh:mm a (12 ساعة مع AM/PM)
  String get formattedTime => DateFormat('hh:mm a').format(this);

  /// تنسيق التاريخ والوقت معًا: hh:mm a\nyyyy/MM/dd
  /// يمكن تحديد اللغة (مثل 'en' أو 'ar')
  String formattedDateTime({String language = 'en'}) =>
      DateFormat('hh:mm a\nyyyy/MM/dd', language).format(this);

  /// يحسب الفرق بين هذا التاريخ وآخر ويعيد Duration
  Duration differenceFrom(DateTime other) => difference(other).abs();
}