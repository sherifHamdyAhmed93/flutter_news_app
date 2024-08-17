import 'package:url_launcher/url_launcher.dart';

class AppUtils{
  static String formatDate(String rawDate) {
    // Parse the ISO date string to a DateTime object
    DateTime parsedDate = DateTime.parse(rawDate);

    // Convert to 12-hour format
    int hour = parsedDate.hour % 12 == 0 ? 12 : parsedDate.hour % 12;
    String minute = parsedDate.minute.toString().padLeft(2, '0');
    // String second = parsedDate.second.toString().padLeft(2, '0');
    String amOrPM = _getAmOrPm(parsedDate);

    // Manually format the date
    String year = parsedDate.year.toString();
    String month = parsedDate.month.toString().padLeft(2, '0');
    String day = parsedDate.day.toString().padLeft(2, '0');
    String formattedHour = hour.toString().padLeft(2, '0');

    // Combine the parts into a formatted string
    return '$year-$month-$day $formattedHour:$minute $amOrPM';
  }

  static String _getAmOrPm(DateTime date) {
    return date.hour >= 12 ? 'PM' : 'AM';
  }


  static Future<void> launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}