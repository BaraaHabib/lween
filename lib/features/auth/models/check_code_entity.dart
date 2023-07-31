
import 'package:lween/core/features/entities/entity.dart';

class CheckCodeEntity extends Entity {
  CheckCodeEntity({
    required this.code,
  });

  final String? code;

  @override
  List<Object?> get props => [code];
}
