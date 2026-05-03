abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested(this.email, this.password);
}

class RegisterRequested extends AuthEvent {
  final String username;
  final String password;
  final String email;
  final String phone;

  RegisterRequested(this.username, this.password, this.email, this.phone);
}
