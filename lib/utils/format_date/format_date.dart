// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormatDate {
  static formatDateBasic(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }

  static formatDateWithTime(DateTime dateTime) {
    return DateFormat('dd MMMM yyyy kk:mm').format(dateTime);
  }

  static formatDateMonth(DateTime dateTime) {
    final locale = Get.locale?.languageCode ?? 'id';
    return DateFormat('MMM', locale).format(dateTime);
  }

  static formatDateDay(DateTime dateTime) {
    return DateFormat('EEEE').format(dateTime);
  }

  static formatDateServer(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static formatTodayDateTime(DateTime dateTime) {
    return DateFormat('EEEE, dd MMMM yyyy HH:mm WIB').format(dateTime);
  }

  static formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String? formatDateOnly(String? date) {
    if (date == null) {
      return null;
    }

    final dateSplit = date.split(' ');
    return dateSplit[0];
  }

  static String formatCustomDate(String dateStr) {
    if (dateStr == "-") {
      return "-";
    }

    final DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    final DateTime dateTime = inputFormat.parse(dateStr);

    final DateFormat outputFormat = DateFormat(
      "EEEE, dd MMMM yyyy",
      Get.locale?.languageCode ?? 'id',
    );

    return outputFormat.format(dateTime);
  }

  static String customTimeExam(String examStart, String examEnd) {
    final DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    final DateTime startDateTime = inputFormat.parse(examStart);
    final DateTime endDateTime = inputFormat.parse(examEnd);

    final DateFormat dateFormat = DateFormat(
      "EEEE, dd MMMM yyyy",
      Get.locale?.languageCode ?? 'id',
    );

    final DateFormat timeFormat = DateFormat("HH:mm");

    String formattedDate = dateFormat.format(startDateTime);
    String formattedStartTime = timeFormat.format(startDateTime);
    String formattedEndTime = timeFormat.format(endDateTime);

    return "$formattedDate • $formattedStartTime-$formattedEndTime";
  }

  static String customTimeEnter(String dateTimeStr) {
    if (dateTimeStr == "-") {
      return "-";
    }
    final DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    final DateTime dateTime = inputFormat.parse(dateTimeStr);

    final DateFormat timeFormat = DateFormat("HH:mm");

    return timeFormat.format(dateTime);
  }

  static String formatRangeScholarship(String startDateStr, String endDateStr) {
    DateTime startDate = DateTime.parse(startDateStr);
    DateTime endDate = DateTime.parse(endDateStr);

    String formattedStartDate =
        "${startDate.day.toString().padLeft(2, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.year}";
    String formattedEndDate =
        "${endDate.day.toString().padLeft(2, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.year}";

    return "$formattedStartDate s/d $formattedEndDate";
  }

  static String formatFlexibleDate(String dateTimeStr) {
    final DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    final DateTime dateTime = inputFormat.parse(dateTimeStr);

    final DateTime now = DateTime.now();

    final DateFormat timeFormat = DateFormat("HH:mm");

    final DateFormat dateWithTimeFormat = DateFormat(
      "dd MMMM, HH:mm",
      Get.locale?.languageCode ?? 'id',
    );

    final DateFormat fullFormat1 = DateFormat("yyyy-MM-dd");
    final DateFormat fullFormat2 = DateFormat("HH:mm");

    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return timeFormat.format(dateTime);
    } else if (dateTime.year == now.year) {
      return dateWithTimeFormat.format(dateTime);
    } else {
      return "${fullFormat1.format(dateTime)}\n${fullFormat2.format(dateTime)}";
    }
  }

  static String formatDateOssDetail(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);

    String language = Get.locale?.languageCode ?? 'id';

    String dayName;
    String timeZone = 'WIB';

    if (language == 'id') {
      dayName = DateFormat('EEEE', 'id_ID').format(dateTime);
    } else {
      dayName = DateFormat('EEEE', 'en_US').format(dateTime);
    }

    String formattedDate = DateFormat(
      'd MMMM yyyy',
      language == 'id' ? 'id_ID' : 'en_US',
    ).format(dateTime);
    String formattedTime = DateFormat('HH:mm').format(dateTime);

    return "$dayName, $formattedDate | $formattedTime $timeZone";
  }

  static String formatDateTanggalProses(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) {
      return '';
    }

    DateTime dateTime;
    try {
      dateTime = DateTime.parse(dateTimeString);
    } catch (e) {
      return '';
    }

    DateTime now = DateTime.now();
    String languageCode = Get.locale?.languageCode ?? 'en';
    String formattedTime = DateFormat('h:mm a', languageCode).format(dateTime);

    if (dateTime.year == now.year) {
      if (dateTime.day == now.day && dateTime.month == now.month) {
        return languageCode == 'id'
            ? "Hari ini, $formattedTime"
            : "Today, $formattedTime";
      } else {
        String formattedDate = DateFormat(
          'dd MMM',
          languageCode,
        ).format(dateTime);
        return "$formattedDate, $formattedTime";
      }
    } else {
      String formattedDate = DateFormat(
        'dd MMM yy',
        languageCode,
      ).format(dateTime);
      return "$formattedDate, $formattedTime";
    }
  }

  static String formatDateParent(String? createdTime, String? updatedTime) {
    String? timeToFormat = updatedTime == "-" ? createdTime : updatedTime;

    if (timeToFormat == null) {
      return "-";
    }

    try {
      final DateTime parsedDate = DateTime.parse(timeToFormat);
      final String formattedDate = DateFormat(
        'dd-MM-yyyy • HH:mm',
      ).format(parsedDate);
      return formattedDate;
    } catch (e) {
      return "-";
    }
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static String formatDateLabel(DateTime date) {
    final now = DateTime.now();
    if (isSameDay(date, now)) return 'Hari ini';

    // Format: Sabtu, 23 Agu 2025  (pakai locale 'id' bila tersedia)
    // Pastikan kamu sudah menginisialisasi locale jika perlu, atau gunakan format sederhana:
    return DateFormat('EEEE, dd MMM yyyy', 'id').format(date);
  }
}
