import 'package:lween/core/features/entities/entity.dart';

class RegisterEntity extends Entity {
  RegisterEntity(
    this.id,
    this.code,
  );

  final int id;
  final String? code;

  @override
  List<Object?> get props => [id, code];
}
