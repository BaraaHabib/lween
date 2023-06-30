import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExt on TimeOfDay {
  TimeOfDay add({int hour = 0, int minutes = 0}) {
    if (minutes == 0) {
      return this;
    } else {
      int mofd = this.hour * 60 + minute;
      int newMofd = ((minutes % 1440) + mofd + 1440) % 1440;
      if (mofd == newMofd) {
        return this;
      } else {
        int newHour = newMofd ~/ 60;
        int newMinute = newMofd % 60;
        return TimeOfDay(hour: newHour, minute: newMinute);
      }
    }
  }

  String to24Format(context) {
    DateTime date = DateFormat.jm()
        .parse(format(context)); // think this will work better for you
    return (DateFormat("HH:mm").format(date));
  }

  String get24Hour(context) {
    DateTime date = DateFormat.jm()
        .parse(format(context)); // think this will work better for you
    return (DateFormat("HH").format(date));
  }

  bool get isDayEndTime => hour == 23 && minute == 59;
}

extension DateExt on DateTime {
  bool sameMonthAs(DateTime other) =>
      month == other.month && year == other.year;
  bool sameDayAs(DateTime other) =>
      month == other.month && year == other.year && day == other.day;

  DateTime copyWith({int? year, int? month, int? day, int? hour, int? min}) {
    final rYear = year ?? this.year;
    final rMonth = month ?? this.month;
    final rDay = day ?? this.day;
    final rHour = hour ?? this.hour;
    final rMin = min ?? minute;

    return DateTime(
      rYear,
      rMonth,
      rDay,
      rHour,
      rMin,
    );
  }

  String get apiFormat => DateFormat('yyyy-MM-dd', 'en').format(this);

  String get apiTimeFormat => DateFormat('HH:mm', 'en').format(this);
}

