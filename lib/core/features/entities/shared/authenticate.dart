

import 'package:lween/core/features/entities/entity.dart';

class AuthenticateEntity extends ContentModel {
  AuthenticateEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.userId,
    required this.isExternalLogin,
  });
  late final String accessToken;
  late final String refreshToken;
  late final String encryptedAccessToken;
  late final int expireInSeconds;
  late final int userId;
  late final bool isExternalLogin;

  AuthenticateEntity.fromJson(json){
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    encryptedAccessToken = json['encryptedAccessToken'] ?? '';
    expireInSeconds = json['expireInSeconds'];
    userId = json['userId'];
    isExternalLogin = json['isExternalLogin'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['encryptedAccessToken'] = encryptedAccessToken ?? '';
    data['expireInSeconds'] = expireInSeconds;
    data['userId'] = userId;
    data['isExternalLogin'] = isExternalLogin ?? false;
    return data;
  }

  @override
  fromJson(json) => AuthenticateEntity.fromJson(json);

  @override
  List<Object?> get props => [userId,];
}
