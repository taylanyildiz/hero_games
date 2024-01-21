import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension StringExt on String? {
  DateTime? toDate() {
    if (this == null) return null;
    return DateTime.parse(this!);
  }
}

extension DateExt on DateTime? {
  /// Datetime to locale
  /// @returns string
  String? locale() {
    if (this == null) return null;
    return DateFormat('EE, MMM d, yyyy', Get.locale?.countryCode ?? "en").format(this!);
  }

  /// Is bigger than
  /// [sec] default 3 seconds
  bool biggerThanSec([int sec = 3]) {
    if (this == null) return false;
    final difDate = DateTime.now().difference(this!).abs();
    final difSec = difDate.inSeconds;
    return difSec >= sec;
  }
}
