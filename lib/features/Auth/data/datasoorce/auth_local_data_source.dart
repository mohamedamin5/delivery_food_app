abstract class AuthLocalDataSource {
  Future<void> saveAuthData(
    String accessToken,
    String refreshToken,
    String role,
    String userId,
  );
  Future<String?> getAuthData(String key);
  Future<void> clearAuthData();
}
