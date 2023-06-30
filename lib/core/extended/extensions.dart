import 'dart:developer';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';

extension DateTimeExten on DateTime {
  DateTime roundUp({Duration delta = const Duration(minutes: 15)}) {
    final roundedDate = add(delta);
    return DateTime.fromMillisecondsSinceEpoch(
      roundedDate.millisecondsSinceEpoch -
          millisecondsSinceEpoch % delta.inMilliseconds,
    );
  }

  DateTime roundDown({Duration delta = const Duration(minutes: 15)}) =>
      DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds,
      );

  bool sameDayAs(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool sameMonthAs(DateTime other) =>
      year == other.year && month == other.month;

  bool sameYearAs(DateTime other) => year == other.year;

  DateTime copyWith(
      {int? year, int? month, int? day, int? hours, int? minutes}) {
    final rYear = year ?? this.year;
    final rMonth = month ?? this.month;
    final rDay = day ?? this.day;
    final rHour = hours ?? hour;
    final rMinutes = minutes ?? minute;

    return DateTime(rYear, rMonth, rDay, rHour, rMinutes);
  }

  DateTime toDate({int? year, int? month, int? day, int? hours, int? minutes}) {
    final rYear = year ?? this.year;
    final rMonth = month ?? this.month;
    final rDay = day ?? this.day;
    final rHour = hours ?? hour;
    final rMinutes = minutes ?? minute;

    return DateTime(
      rYear,
      rMonth,
      rDay,
      rHour,
      rMinutes,
    );
  }

  DateTime removeDate(
          {int? year, int? month, int? day, int? hours, int? minutes}) =>
      DateTime(0, 0, 0, hour, minute, second);

  /// use this to calculate date in hour, minuit, seconds only
  /// this is to avoid day light saving issues
  Duration timeDifferenceOnly(DateTime other) =>
      removeDate().difference(other.removeDate());

  String get apiFormat =>
      DateFormat('E,d LLL yyyy HH:mm:ss', 'en').format(this);

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  int numOfWeeks(int year) {
    final dec28 = DateTime(year, 12, 28);
    final dayOfDec28 = int.parse(DateFormat('D').format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  int get weekNumber {
    final todayInDays = difference(DateTime(year, 1, 1, 0, 0)).inDays;
    if (todayInDays >= 7) {
      return todayInDays ~/ 7;
    } else {
      return 1;
    }
  }
}

extension IntExten on num {
  num get fixed {
    var result = this;
    if (result == roundToDouble()) {
      result = toInt();
    }
    return result;
  }
}

extension FileExten on File {
 double get size {
    int sizeInBytes = lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return sizeInMb;
  }

  String? get extension {
    final ext = path.split('.').lastOrNull;
    if (ext != null) {
      if (ext.endsWith(path.split('/').last)) {
        var mime =
            lookupMimeType(path, headerBytes: readAsBytesSync().toList());
        if (mime?.split('/').last == 'mpeg') {
          return 'mp3';
        } else {
          return mime?.split('/').lastOrNull ?? '';
        }
      }
    }
    return ext;
  }

  String? get nameWithoutExtension {
    var parts = path.split('/');
    if (parts.isNotEmpty) {
      parts = parts.last.split('.');
      if (parts.isNotEmpty) {
        return parts[0];
      }
    }
    return null;
  }

  String? get nameWithExtension {
    var parts = path.split('/').lastOrNull;
    if (!parts!.contains('.')) {
      var mime = lookupMimeType(path, headerBytes: readAsBytesSync().toList());
      if (mime?.split('/').last == 'mpeg') {
        return '$parts.mp3';
      } else {
        return '$parts.${mime?.split('/').lastOrNull ?? 'Doc'}';
      }
    } else {
      return parts;
    }
  }

  String? get pathWithExtension {
    var parts = path.split('/').lastOrNull;
    if (!parts!.contains('.')) {
      var mime = lookupMimeType(path, headerBytes: readAsBytesSync().toList());
      if (mime?.split('/').last == 'mpeg') {
        return '$path.mp3';
      } else {
        return '$path.${mime?.split('/').lastOrNull ?? 'Doc'}';
      }
    } else {
      return path;
    }
  }
}

extension StringExtension on String {
  String get capitalize => '${this[0].toUpperCase()}'
      '${substring(1).toLowerCase()}';

  String get asRequired => '$this *';
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}

extension WidgetsWrappers on Widget {
  SliverToBoxAdapter sliverToBoxAdapter() => SliverToBoxAdapter(
        child: this,
      );

  InkWell withBasicInkWellFunctionality({void Function()? onTap}) => InkWell(
        onTap: onTap,
        child: this,
      );
}

extension Logger<T> on T {
  logger({String? name}) {
    final lodgeableObject = this;
    var message = "";
    if (T is String) {
      message = lodgeableObject as String;
    } else {
      message = lodgeableObject?.toString() ?? "Null";
    }

    return log(message, name: name ?? "");
  }
}

extension DurationExt on Duration {
  Duration copyDuration() {
    final originalDuration = this;
    return Duration(
      days: originalDuration.inDays,
      hours: originalDuration.inHours % 24,
      minutes: originalDuration.inMinutes % 60,
      seconds: originalDuration.inSeconds % 60,
      milliseconds: originalDuration.inMilliseconds % 1000,
      microseconds: originalDuration.inMicroseconds % 1000,
    );
  }

  String getMinutesAndSecondsDuration() {
    final Duration duration = this;
    String durationString =
        "${(duration.inSeconds / 60).floor().toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
    return durationString;
  }
}
