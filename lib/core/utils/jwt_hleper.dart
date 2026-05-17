import 'package:jwt_decoder/jwt_decoder.dart';

// user_data = {"sub": str(user_id), "role": role}
class JwtService {
  bool isTokenValid(String? token) {
    if (token == null || token.isEmpty) return false;
    try {
      return !JwtDecoder.isExpired(token);
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic>? getUserData(String? token) {
    if (token == null || token.isEmpty) return null;
    try {
      return JwtDecoder.decode(token);
    } catch (e) {
      return null;
    }
  }

  String? getUserRole(String? token) {
    final data = getUserData(token);
    return data?['role']?.toString();
  }

  String? getUserId(String? token) {
    final data = getUserData(token);
    return data?['sub']?.toString();
  }
}
