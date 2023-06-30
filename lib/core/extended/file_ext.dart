part of 'ext.dart';

extension on File {
  String? get extension => path.split('.').lastOrNull;
}
