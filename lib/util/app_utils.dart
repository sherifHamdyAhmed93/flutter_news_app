import 'package:url_launcher/url_launcher.dart';
import 'dart:io' as io;

class AppUtils{
  static String formatDate(String rawDate) {
    // Parse the ISO date string to a DateTime object
    DateTime parsedDate = DateTime.parse(rawDate);

    // Manually format the date
    String year = parsedDate.year.toString();
    String month = parsedDate.month.toString().padLeft(2, '0');
    String day = parsedDate.day.toString().padLeft(2, '0');
    String hour = parsedDate.hour.toString().padLeft(2, '0');
    String minute = parsedDate.minute.toString().padLeft(2, '0');
    String second = parsedDate.second.toString().padLeft(2, '0');

    // Combine the parts into a formatted string
    return '$year-$month-$day $hour:$minute:$second';
  }

  static Future<void> launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}