
import 'package:lween/core/features/entities/entity.dart';

class ForgetPasswordEntity extends Entity {
  ForgetPasswordEntity({
    // required this.result,
    required this.success,
    required this.statusCode,
    required this.error,
  });
  //final LogInContentModel result;
  final bool success;
  final int statusCode;
  final String error;

  @override
  List<Object?> get props => [success, statusCode, error];
}
