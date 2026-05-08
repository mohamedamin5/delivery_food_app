import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested(this.email, this.password);
}

class RegisterRequested extends AuthEvent {
  final String username;
  final String password;
  final String email;
  final String retypePassword;

  const RegisterRequested(
    this.username,
    this.password,
    this.email,
    this.retypePassword,
  );
}
