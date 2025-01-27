import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

unFocusKeyboard() {
  FocusScopeNode currentFocus = FocusScope.of(Get.context!);
  return currentFocus.unfocus();
}

formatDate(DateTime dateTime) {
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  return dateFormat.format(dateTime);
}

/////////////////////   04 January 2025
getFormattedDate(String dateString) {
  try {
    // Parse the input string into a DateTime object
    DateTime date = DateTime.parse(dateString);

    // Format the date into the desired format
    String formattedDate =
        "${date.day} ${_getMonthName(date.month)} ${date.year}";

    return formattedDate;
  } catch (e) {
    // Handle any parsing errors
    return "Invalid date format";
  }
}

DateTime getStartOfMonth() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, 1); // Start of the current month
}

String getMonthName(String dateString) {
  try {
    // Parse the input date string to a DateTime object
    DateTime date = DateTime.parse(dateString);

    // Use DateFormat to get the month name
    return DateFormat('MMMM')
        .format(date); // Outputs full month name, e.g., January
  } catch (e) {
    // Handle any parsing errors
    print("Error parsing date: $e");
    return "Invalid date";
  }
}

String getYearFromDate(String dateString) {
  try {
    // Parse the input date string to a DateTime object
    DateTime date = DateTime.parse(dateString);

    // Use DateFormat to get the month name
    return date.year.toString();
  } catch (e) {
    // Handle any parsing errors
    print("Error parsing date: $e");
    return "Invalid date";
  }
}

// Helper method to get the month name
String _getMonthName(int month) {
  const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  return months[month - 1];
}

// bool isValidFullName(String? value) {
//   if (value == null || value.isEmpty) {
//     return false; // Field is required
//   }
//   // Regular expression to ensure the full name has at least two words
//   RegExp fullNameRegExp = RegExp(r'^[a-zA-Z]+(\s+[a-zA-Z]+)+$');
//   return fullNameRegExp.hasMatch(value);
// }
