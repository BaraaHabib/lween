
import 'package:flutter/material.dart';
import 'package:lween/core/extended/get_utils/src/extensions/export.dart';
import 'package:lween/core/resources/regex.dart';

import '../get_utils/get_utils.dart';

extension GetStringUtils on String {
  bool get isNum => GetUtils.isNum(this);

  bool get isNumericOnly => GetUtils.isNumericOnly(this);

  bool get isAlphabetOnly => GetUtils.isAlphabetOnly(this);

  bool get isBool => GetUtils.isBool(this);

  /// this extension to check if string starts with
  /// a RTL letter
  bool get startWithRTL {
    if (isBlank ?? true) {
      return false;
    }

    for (final c in characters) {
      if (Regex.isNotEmoji.hasMatch(c)) {
        return Regex.isRTL.hasMatch(c);
      }
    }
    return false;
  }

  /// this extension to check if string starts with
  /// a RTL letter
  bool get isAllRTL {
    if (isBlank ?? true) {
      return false;
    }
    return characters.fold<bool>(
        false, (bool value, element) => Regex.isRTL.hasMatch(element) &&
        value);
  }


  /// this extension will return preferred text direction (rtl, ltr)
  TextDirection get preferredDirection {
    if(isAllRTL){
      return TextDirection.ltr;
    }
    if(
    // intl.Bidi.detectRtlDirectionality(this)
    startWithRTL
    ) {
      return TextDirection.rtl;
    }
    return TextDirection.ltr;
  }

  bool get isVectorFileName => GetUtils.isVector(this);

  bool get isImageFileName => GetUtils.isImage(this);

  bool get isAudioFileName => GetUtils.isAudio(this);

  bool get isVideoFileName => GetUtils.isVideo(this);

  bool get isTxtFileName => GetUtils.isTxt(this);

  bool get isDocumentFileName => GetUtils.isWord(this);

  bool get isExcelFileName => GetUtils.isExcel(this);

  bool get isPPTFileName => GetUtils.isPPT(this);

  bool get isAPKFileName => GetUtils.isAPK(this);

  bool get isPDFFileName => GetUtils.isPDF(this);

  String? get fileExtension => GetUtils.fileExtension(this);

  bool get isHTMLFileName => GetUtils.isHTML(this);

  bool get isURL => GetUtils.isURL(this);

  bool get isEmail => GetUtils.isEmail(this);

  bool get isPhoneNumber => GetUtils.isPhoneNumber(this);

  bool get isDateTime => GetUtils.isDateTime(this);

  bool get isMD5 => GetUtils.isMD5(this);

  bool get isSHA1 => GetUtils.isSHA1(this);

  bool get isSHA256 => GetUtils.isSHA256(this);

  bool get isUuidV4 => GetUtils.isUUIDV4(this);

  bool get isBinary => GetUtils.isBinary(this);

  bool get isIPv4 => GetUtils.isIPv4(this);

  bool get isIPv6 => GetUtils.isIPv6(this);

  bool get isHexadecimal => GetUtils.isHexadecimal(this);

  bool get isPalindrom => GetUtils.isPalindrom(this);

  bool get isPassport => GetUtils.isPassport(this);

  bool get isCurrency => GetUtils.isCurrency(this);

  bool get isCpf => GetUtils.isCpf(this);

  bool get isCnpj => GetUtils.isCnpj(this);

  bool isCaseInsensitiveContains(String b) =>
      GetUtils.isCaseInsensitiveContains(this, b);

  bool isCaseInsensitiveContainsAny(String b) =>
      GetUtils.isCaseInsensitiveContainsAny(this, b);

  String? get capitalize => GetUtils.capitalize(this);

  String? get capitalizeFirst => GetUtils.capitalizeFirst(this);

  String get removeAllWhitespace => GetUtils.removeAllWhitespace(this);

  String? get camelCase => GetUtils.camelCase(this);

  String? get paramCase => GetUtils.paramCase(this);

  String numericOnly({bool firstWordOnly = false}) =>
      GetUtils.numericOnly(this, firstWordOnly: firstWordOnly);

  String createPath([Iterable? segments]) {
    final path = startsWith('/') ? this : '/$this';
    return GetUtils.createPath(path, segments);
  }
}
