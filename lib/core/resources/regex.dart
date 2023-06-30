abstract class Regex {
  static const firstLastNameRegex = '^[a-zA-Zء-ي]{3,20} [a-zA-Zء-ي]{3,20}\$';
  static const userNameRegex = "[^W_](?!.*?[._]{2})[w.]{6,18}[^W_]\$";
  static const phone = r'^[+]{1}\d{7,15}$';
  static const email  =  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static final RegExp minsSecDurationRegExPattern = RegExp(r'^\d+:\d{2}$');
  static final RegExp hrsMinsSecDurationRegExPattern =
      RegExp(r'^(\d+:)?\d{2}:\d{2}$');

  /// this regex will match rtl characters
  static final RegExp isRTL = RegExp(
      r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]');

  /// this regex should non emoji characters
  static final RegExp isNotEmoji = RegExp(r'^[a-zA-Z0-9\u0600-\u06FF\s]+$');

  static final getIntFromStringRegex = RegExp(r'\d+');
  static final isFullNameToGetFirstLetterForEachRegex = RegExp(r'^([A-Za-z])[A-Za-z]+\s([A-Za-z])[A-Za-z]+$');
}
