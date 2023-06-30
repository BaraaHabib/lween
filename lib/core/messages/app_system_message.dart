enum AppSystemMessageTyp { toast, dialog }

abstract class AppSystemMessage {
  AppSystemMessage({
    required this.type,
    required this.message,
    this.title,
  });

  final AppSystemMessageTyp type;
  final String? title;
  final String message;

  Future show();
}
