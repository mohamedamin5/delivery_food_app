import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super("No internet connection");

  @override
  List<Object?> get props => [message];
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class LocalFailure extends Failure {
  const LocalFailure(super.message);
  @override
  List<Object?> get props => [message];
}
