import 'package:flutter/material.dart';
import 'package:lween/core/resources/regex.dart';

import 'numbers_ext.dart';

extension NullableStrings on String? {
  bool isEmptyExt() {
    if (this == null) {
      return true;
    }

    return this!.isEmpty;
  }

  bool get isAssets {
    if (this == null || this == '') {
      return true;
    }

    return !this!.toLowerCase().contains('http');
  }

  String get reverse => (this ?? '').split('').reversed.join();

  TimeOfDay get toTimeOfDay {
    if (this == null || !this!.contains(':') || this!.split(':').length < 2) {
      return TimeOfDay.now();
    }
    var parts = this!.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  String get roundAndPrecise =>
      (num.tryParse(this ?? '0')?.toPrecision() ?? 0).toStringAsFixed(2);

  String get getMinsSecFormattedDuration {
    String formattedDuration = "00:00";
    String durationString = this ?? formattedDuration;

    if (Regex.hrsMinsSecDurationRegExPattern.hasMatch(durationString)) {
      List<String> durationParts = durationString.split(":");
      Duration duration = Duration(
        minutes: int.parse(durationParts[1]),
        seconds: int.parse(durationParts[2]),
      );
      formattedDuration =
          "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
    }

    return formattedDuration;
  }
}
