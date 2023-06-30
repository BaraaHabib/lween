
import 'package:lween/core/features/entities/entity.dart';

class VerifyAccountEntity extends Entity {
  VerifyAccountEntity(
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  );

  final int? expiresIn;
  final String? accessToken;
  final String? refreshToken;

  @override
  List<Object?> get props => [expiresIn, accessToken, refreshToken];
}
