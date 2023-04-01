import 'package:intl/intl.dart';

class DateTimeManager {
  static String getFormattedDateFromFormattedString(
      {required String? value, String desiredFormat = 'MMMM dd, yyyy, kk:mm'}) {
    ///one of the possible formats: yyyy MMMM dd, kk:mm
    DateTime? dateTime = DateTime.now();

    String formattedDate = '';
    if (value == null || value.isEmpty) {
      return formattedDate;
    }
    try {
      dateTime = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(value).toLocal();
      formattedDate = DateFormat(desiredFormat, 'en_US').format(dateTime);
      // final newFormattedDate = DateTime.fromMillisecondsSinceEpoch(dateTimeInt).toUtc().toString();
      //     formattedDate = newFormattedDate;
      //  print('dateTimeInt: $dateTimeInt');
      //  print('newFormattedDate: $newFormattedDate');
    } catch (e) {
      rethrow;
    }
    return formattedDate;
  }

  ///Example: input is 72, returned result is 1:12
  String intToString(int seconds) {
    int hours = seconds ~/ 60;
    int minutes = seconds % 60;
    String minutesResult = minutes <= 9 ? '0$minutes' : '$minutes';
    String hoursResult = hours <= 9 ? '0$hours' : '$hours';
    return '$hoursResult:$minutesResult';
  }
}
