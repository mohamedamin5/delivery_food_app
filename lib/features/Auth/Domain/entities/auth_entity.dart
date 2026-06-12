import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String firebaseToken;
  final String userId;
  final String role;

  const AuthEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.firebaseToken,
    required this.userId,
    required this.role,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
