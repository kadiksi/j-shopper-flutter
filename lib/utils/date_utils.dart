import 'package:intl/intl.dart';

String formatFromDateToddMMyyyy(DateTime dateTime) {
  String formattedDate = DateFormat('dd.MM.yyyy').format(dateTime);
  return formattedDate;
}
