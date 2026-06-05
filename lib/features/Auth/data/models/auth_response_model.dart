class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final String firebaseToken;
  final String userId;
  final String role;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.role,
    required this.firebaseToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      firebaseToken: json['firebase_token'] as String,
      userId: json['user_id'] as String,
      role: json['role'] as String,
    );
  }
}
