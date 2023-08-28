import 'package:lween/core/features/entities/entity.dart';

class ResendCodeEntity extends Entity {
  ResendCodeEntity(
    this.code,
  );

  final String? code;

  @override
  List<Object?> get props => [code];
}
