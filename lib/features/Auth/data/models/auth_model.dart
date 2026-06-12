import 'package:flutter_application_2/features/Auth/Domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.accessToken,
    required super.refreshToken,
    required super.firebaseToken,
    required super.userId,
    required super.role,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      firebaseToken: json['firebase_token'] as String,
      userId: json['user_id'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "access_token": accessToken,
      "refresh_token": refreshToken,
      "firebase_token": firebaseToken,
      "user_id": userId,
      "role": role,
    };
  }
}
