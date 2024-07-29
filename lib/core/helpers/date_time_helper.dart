import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formatDateOnly(DateTime dateTime) =>
      DateFormat('dd/MM/yyyy').format(dateTime);
}
