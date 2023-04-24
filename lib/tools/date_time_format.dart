import 'package:intl/intl.dart';

String dateTimeFormat(String date) {
  DateTime noticeDate = DateTime.parse(date);
  String formatedDate = DateFormat('EEEE, MMM d').format(noticeDate);
  return formatedDate;
}

String dateTimeFormatNum(String date) {
  DateTime noticeDate = DateTime.parse(date);
  String formatedDate = DateFormat('EEEE, MMM d, h:mm a').format(noticeDate);
  return formatedDate;
}
