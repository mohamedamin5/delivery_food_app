import 'package:flutter_application_2/features/Auth/data/models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(String email, String password);
  Future<AuthResponseModel> register(
    String username,
    String password,
    String email,
    String phone,
  );
}
