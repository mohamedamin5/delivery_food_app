import 'package:flutter_application_2/features/Auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(String email, String password);
  Future<AuthModel> register(
    String username,
    String password,
    String email,
    String phone,
  );
}
