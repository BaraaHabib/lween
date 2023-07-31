//#region message type
enum ChatMessageType { text, image, file, voiceNote, video }

extension PTEXT on ChatMessageType {
  String get fullName {
    switch (this) {
      case ChatMessageType.text:
        return 'text';
      case ChatMessageType.image:
        return 'image';
      case ChatMessageType.file:
        return 'file';
      case ChatMessageType.voiceNote:
        return 'voiceNote';
      case ChatMessageType.video:
        return 'video';
    }
  }

  int get apiValue => index + 1;
}
//#endregion
