// ignore_for_file: non_constant_identifier_names, constant_identifier_names


import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:lween/core/configurations/env_config.dart';

import 'env.dart';

class AppConfigurations {
  static var env = Environment().config;
  static const String ApplicationName = 'Lween';

  static String BaseUrl = env.baseUrl;

  static get stagingOrDevelopment =>
      kDebugMode || AppConfigurations.env is DevConfig;


  static const apiVersion = '1.0';

  static const Map<String, String> BaseHeaders = {
    'accept': 'text/plain',
    'Content-Type': 'application/json',
    'X-API-Version' : apiVersion,
  };


  /// formats
  static DateFormat appDisplayDateFormat = DateFormat('dd/MM/yyyy', 'en');
  static DateFormat appDisplayDateOfBirth = DateFormat('dd/MM/yyyy');
  static DateFormat appDisplayDateTimeFormat =
      DateFormat('dd/MM/yyyy   HH:mm  ', 'en');
  static DateFormat appDisplayDateTimeFormatWithAmPm =
      DateFormat('dd/MM/yyyy   HH:mm a', 'en');
  static DateFormat appointmentApiDateTimeFormat =
      DateFormat('E,d LLL yyyy HH:mm:ss', 'en'); // "Tue,13 Jul 2021 00:00:43 ",
  static DateFormat appointmentApiTimeFormat = DateFormat('HH:mm'); // "00:00",
  static DateFormat profileDateFormat =
      DateFormat('yyyy-MM-dd', 'en'); // "00:00",
  static DateFormat appointmentDateFormat =
      //DateFormat("yyyy-MM-dd hh:mm aa",'en');// "00:00",
      DateFormat('yyyy-MM-dd HH:mm ', 'en'); // "00:00",
  static DateFormat appointmentDateFormatInUtc =
      //DateFormat("yyyy-MM-dd hh:mm aa",'en');// "00:00",
      DateFormat('yyyy-MM-ddTHH:mm:ssZ '); // "00:00",
  static DateFormat appointmentCreateApiDateTimeFormat =
      DateFormat('yyyy-MM-ddTHH:mm:ss', 'en');
  static DateFormat dayDispalyApiDateTimeFormat =
      DateFormat('EEEE d LLLL yyyy', 'en');
  static DateFormat hourDispalyApiDateTimeFormat = DateFormat('HH:mm a', 'en');

  static String hourDisplayApiDateTimeFormatWithLocale(
    DateTime value,
    String locale,
  ) =>
      DateFormat('HH:mm a', locale).format(value);

  static String hourDisplayApiDateTimeFormatWithLocaleWithoutAmPm(
    DateTime value,
    String locale,
  ) =>
      DateFormat('HH:mm', locale).format(value);

  static String dayDisplayApiDateTimeFormatWithLocale(
    DateTime value,
    String locale,
  ) =>
      '${DateFormat(
        'EEEE ',
        locale,
      ).format(value)}${DateFormat(
        'd ',
        'en',
      ).format(value)}${DateFormat(
        'LLLL ',
        locale,
      ).format(value)}${DateFormat(
        'yyyy',
        'en',
      ).format(value)}';

  static bool isArabicInputPrevented = false;

}

const defaultFractionDigitsCount = 2;
const minPasswordLength = 7;
