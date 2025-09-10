import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateTime(
    int millisecondsSinceEpoch, {
    String pattern = 'dd-MM-yyyy hh:mm a',
  }) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      millisecondsSinceEpoch,
      isUtc: false,
    ).toLocal();
    return DateFormat(pattern).format(dateTime);
  }
}
