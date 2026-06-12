import 'package:flutter_application_2/features/Auth/Domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<void> logout() async {
    _authRepository.logout();
  }
}
