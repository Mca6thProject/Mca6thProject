import 'package:intl/intl.dart';

String dateTimeFormat(String date) {
  DateTime AnnoucementDate = DateTime.parse(date);
  String formatedDate = DateFormat('EEEE, MMM d').format(AnnoucementDate);
  return formatedDate;
}

String dateTimeFormatNum(String date) {
  DateTime AnnoucementDate = DateTime.parse(date);
  String formatedDate =
      DateFormat('EEEE, MMM d, h:mm a').format(AnnoucementDate);
  return formatedDate;
}
