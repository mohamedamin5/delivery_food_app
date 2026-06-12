import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/core/errors/failures.dart';
import 'package:flutter_application_2/features/Auth/Domain/entities/auth_entity.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_local_data_source.dart';
import 'package:flutter_application_2/features/Auth/data/datasoorce/auth_remote_data_source_imp.dart';

class AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSourceImp remoteDataSource;

  AuthRepository(this.localDataSource, this.remoteDataSource);

  Future<Either<Failure, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.login(email, password);
      await localDataSource.saveAuthData(
        response.accessToken,
        response.refreshToken,
        response.role,
        response.userId,
      );
      await FirebaseAuth.instance.signInWithCustomToken(response.firebaseToken);

      return Right(response);
    } catch (e) {
      return Left(ServerFailure("Login failed: $e"));
    }
  }

  Future<Either<Failure, AuthEntity>> register({
    required String username,
    required String password,
    required String email,
    required String phone,
  }) async {
    try {
      final response = await remoteDataSource.register(
        username,
        password,
        email,
        phone,
      );

      await localDataSource.saveAuthData(
        response.accessToken,
        response.refreshToken,
        response.role,
        response.userId,
      );
      await FirebaseAuth.instance.signInWithCustomToken(response.firebaseToken);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure("Registration failed: $e"));
    }
  }

  Future<void> logout() async {
    await localDataSource.clearAuthData();
  }
}
