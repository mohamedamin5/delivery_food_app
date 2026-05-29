class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final String userId;
  final String role;

  AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.userId,
    required this.role,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      userId: json['userId'] as String,
      role: json['role'] as String,
    );
  }
}
