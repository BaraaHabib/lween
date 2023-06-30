import 'package:lween/core/features/entities/entity.dart';

class ChangePasswordEntity extends Entity {
  ChangePasswordEntity({
    required this.success,
    required this.statusCode,
    required this.error,
  });

  final bool success;
  final int statusCode;
  final String error;

  @override
  List<Object?> get props => [success, statusCode, error];
}
