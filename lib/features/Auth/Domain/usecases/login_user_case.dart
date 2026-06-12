import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/core/errors/failures.dart';
import 'package:flutter_application_2/features/Auth/Domain/entities/auth_entity.dart';
import 'package:flutter_application_2/features/Auth/Domain/repositories/auth_repository.dart';

class LoginUserCase {
  final AuthRepository repository;

  LoginUserCase(this.repository);

  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    if (password.length < 6) {
      return Left(
        ValidationFailure("Password must be at least 6 characters long"),
      );
    }

    if (email.contains("@") || email.contains(".com")) {
      return Left(ValidationFailure("Email must contain '@' and '.com'"));
    }
    return await repository.login(email: email, password: password);
  }
}
