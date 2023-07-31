// ignore_for_file: non_constant_identifier_names, constant_identifier_names


import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:lween/core/configurations/env_config.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/generated/l10n.dart';

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
  static DateFormat appAPIDateFormat = DateFormat('MM-dd-yyyy', langEN);
  static DateFormat appDisplayDateFormat = DateFormat('dd/MM/yyyy', langEN);
  static DateFormat appDisplayDateFormatHB = DateFormat('dd/MM/yyyy HH:mm', langEN);

  static String currency = S.current.currency;

  static bool isArabicInputPrevented = false;

}

const defaultFractionDigitsCount = 2;
const minPasswordLength = 7;
